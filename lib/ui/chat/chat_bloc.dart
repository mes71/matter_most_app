import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:matter_most_app/data/repository/local_repository.dart';
import 'package:matter_most_app/data/repository/remote_repsitory.dart';
import 'package:matter_most_app/data/server/model/request/app_request.dart';
import 'package:matter_most_app/data/server/model/responses/post/create_post_response.dart';
import 'package:matter_most_app/data/server/model/responses/post/get_all_posts_response.dart';

part 'chat_event.dart';

part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  GetAllPostsResponse? countPost;

  ChatBloc(
      {required IRemoteRepository remoteRepository,
      required ILocalRepository localRepository})
      : super(ChatInitial()) {
    on<ChatEvent>((event, emit) async {});

    on<ChatStart>((event, emit) async {
      try {
        emit(ChatLoading());
        await Future.delayed(Duration(milliseconds: 2500));

        countPost = await remoteRepository.getAllPostsChannelsRepository(
            token: localRepository.readTokenRepository());

        emit(ChatSuccess(countPost!));
      } catch (e) {
        emit(ChatFailure(e.toString()));
      }
    });

    on<CreatePost>((event, emit) async {
      try {
        CreatePostResponse response =
            await remoteRepository.createPostRepository(
                token: localRepository.readTokenRepository(),
                message: createPostRequest(
                    channelId: '8t5tibt5ktdajx1r9dza4r8gte',
                    message: event.message));



        emit(PostCreateSuccess(response.message!));
      } catch (e) {
        emit(ChatFailure('$e'));
      }
    });
  }
}
