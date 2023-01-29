import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:matter_most_app/data/repository/local_repository.dart';
import 'package:matter_most_app/data/repository/remote_repsitory.dart';
import 'package:matter_most_app/data/server/model/request/app_request.dart';
import 'package:matter_most_app/data/server/model/responses/post/get_all_posts_response.dart';
import 'package:matter_most_app/data/server/model/responses/post/post_response.dart';
import 'package:matter_most_app/data/server/sokect_model/Posted_socket_model.dart';
import 'package:matter_most_app/data/utils/utils.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  GetAllPostsResponse? allPostsResponse;

  List<String> orders = [];
  Map<String, PostResponse> posts = {};

  var seqID = 0;

  ChatBloc(
      {required IRemoteRepository remoteRepository,
      required ILocalRepository localRepository})
      : super(ChatInitial()) {
    on<ChatEvent>((event, emit) async {});

    on<ChatStartEvent>((event, emit) async {
      try {
        emit(ChatLoading());
        wacthToChannel();

        //await Future.delayed(const Duration(milliseconds: 1500));

        allPostsResponse = await remoteRepository.getAllPostsChannelsRepository(
            token: localRepository.readTokenRepository());

        if (allPostsResponse!.posts.isNotEmpty) {
          orders.addAll(allPostsResponse!.order);
          posts.addAll(allPostsResponse!.posts);

          emit(ChatSuccess(orders: orders, posts: posts));
        } else {
          emit(ChatIsEmpty());
        }
      } catch (e) {
        emit(ChatFailure(e.toString()));
      }
    });

    on<CreatePostEvent>((event, emit) async {
      try {
        PostResponse response = await remoteRepository.createPostRepository(
            token: localRepository.readTokenRepository(),
            message: createPostRequest(
                channelId: '8t5tibt5ktdajx1r9dza4r8gte',
                message: event.message));
        orders.insert(0, response.id!);
        posts['${response.id}'] = response;

        emit(ChatSuccess(orders: orders, posts: posts));
      } catch (e) {
        emit(ChatFailure('$e'));
      }
    });

    on<ChatAuthWithSocketEvent>((event, emit) async {});

    on<ChatCloseSocketEvent>((event, emit) {});
  }

  void wacthToChannel() async {
    WebSocketChannel channel = WebSocketChannel.connect(
        Uri.parse('wss://mm.atwork.ir/api/v4/websocket'));

    await channel.ready;

    Stream channelStream = getReadySocket(channel);

    listenToChannel(channelStream, channel);
  }

  listenToChannel(Stream channel, WebSocketChannel webSocketChannel) {
    channel.asBroadcastStream().listen(
        (event) {
          event.toString().toWarningPrint();
          var ev = jsonDecode(event.toString());
          if (ev['event'] != null && ev['event'] == 'posted') {
            PostedSocketModel postedSocketModel =
                PostedSocketModel.fromJson(ev);
            if (postedSocketModel.data?.post?.userId !=
                '5ak9ej4hu7fcp8t91ef13h6mhw') {
              orders.insert(0, postedSocketModel.data!.post!.id!);
              posts['${postedSocketModel.data?.post!.id}'] =
                  postedSocketModel.data!.post!;

              emit(ChatSuccess(orders: orders, posts: posts));
            }
          }
        },
        onError: (e) => e.toString().toErrorPrint(),
        onDone: () {
          'On Done'.toWarningPrint();

          wacthToChannel();
        });
  }

  Stream getReadySocket(WebSocketChannel channel) {
    channel.sink.add(
      jsonEncode({
        "seq": 1,
        "action": "authentication_challenge",
        "data": {"token": localRepository.readTokenRepository()}
      }),
    );

    return channel.stream;
  }
}
