part of 'chat_bloc.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object?> get props => [];
}

class ChatStart extends ChatEvent {}

class CreatePost extends ChatEvent {
  final String message;

  const CreatePost(this.message);

  @override
  List<Object?> get props => [message];
}
