part of 'chat_bloc.dart';

abstract class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {}

class ChatSuccess extends ChatState {
  final GetAllPostsResponse allPosts;

  const ChatSuccess(this.allPosts);

  @override
  List<Object> get props => [allPosts];
}

class ChatFailure extends ChatState {
  final String errorMsg;

  const ChatFailure(this.errorMsg);

  @override
  List<Object> get props => [errorMsg];
}
