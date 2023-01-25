part of 'chat_bloc.dart';

abstract class ChatState extends Equatable {
  const ChatState();
}

class ChatInitial extends ChatState {
  @override
  List<Object?> get props => [];
}

class ChatLoading extends ChatState {
  @override
  List<Object?> get props => [];
}

class ChatIsEmpty extends ChatState {
  @override
  List<Object?> get props => [];
}

class ChatSendingPost extends ChatState {
  @override
  List<Object?> get props => [];
}

class ChatSuccess extends ChatState {
  final List<String> orders;
  final Map<String, PostResponse> posts;

  const ChatSuccess({required this.orders, required this.posts});

  @override
  List<Object> get props => [orders, posts];
}

class ChatFailure extends ChatState {
  final String errorMsg;

  const ChatFailure(this.errorMsg);

  @override
  List<Object?> get props => [errorMsg];
}

class PostCreateSuccess extends ChatState {
  final String message;

  const PostCreateSuccess(this.message);

  @override
  List<Object> get props => [message];
}
