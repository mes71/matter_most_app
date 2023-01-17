import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:matter_most_app/data/repository/local_repository.dart';
import 'package:matter_most_app/data/repository/remote_repsitory.dart';
import 'package:matter_most_app/data/server/model/responses/post/get_all_posts_response.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc(
      {required IRemoteRepository remoteRepository,
      required ILocalRepository localRepository})
      : super(ChatInitial()) {
    on<ChatEvent>((event, emit) async {});

    on<ChatStart>((event, emit) async {
      try {
        emit(ChatLoading());
        await Future.delayed(Duration(milliseconds: 2500));

        GetAllPostsResponse countPost =
            await remoteRepository.getAllPostsChannelsRepository(
                token: localRepository.readTokenRepository());

        emit(ChatSuccess(countPost));
      } catch (e) {
        emit(ChatFailure(e.toString()));
      }
    });
  }
}
