import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:matter_most_app/data/repository/local_repository.dart';
import 'package:matter_most_app/data/repository/remote_repsitory.dart';
import 'package:matter_most_app/data/server/model/request/app_request.dart';
import 'package:matter_most_app/data/server/model/request/socket/app_socket.dart';
import 'package:matter_most_app/data/server/model/responses/post/get_all_posts_response.dart';
import 'package:matter_most_app/data/server/model/responses/post/post_response.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

part 'chat_event.dart';

part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  GetAllPostsResponse? allPostsResponse;

  List<String> orders = [];
  Map<String, PostResponse> posts = {};
  final channel = WebSocketChannel.connect(
      Uri.parse('wss://mm.atwork.ir/api/v4/websocket'));
  var seqID = 0;

  ChatBloc(
      {required IRemoteRepository remoteRepository,
      required ILocalRepository localRepository})
      : super(ChatInitial()) {
    on<ChatEvent>((event, emit) async {});

    on<ChatStartEvent>((event, emit) async {
      try {
        emit(ChatLoading());
        await Future.delayed(const Duration(milliseconds: 1500));

        allPostsResponse = await remoteRepository.getAllPostsChannelsRepository(
            token: localRepository.readTokenRepository());

        if (allPostsResponse!.posts.isNotEmpty) {
          orders.addAll(allPostsResponse!.order);
          posts.addAll(allPostsResponse!.posts);

          emit(ChatSuccess(orders: orders, posts: posts));
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

        orders.add(response.id!);
        posts['${response.id}'] = response;
        List<String> newOrder = orders;
        Map<String, PostResponse> newPosts = posts;

        emit(ChatSuccess(orders: newOrder, posts: newPosts));



      } catch (e) {
        log('Error ================>$e');
        emit(ChatFailure('$e'));
      }
    });

    on<ChatAuthWithSocketEvent>((event, emit) => channel.sink.add(
        sendSocketEvent(
            action: AUTH_ACTION_SOCKET,
            seq: seqID,
            data: {TOKEN_DATA_SOCKET: localRepository.readTokenRepository()})));

    on<ChatCloseSocketEvent>((event, emit) => channel.sink.close());
  }
}
