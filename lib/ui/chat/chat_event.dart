part of 'chat_bloc.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object?> get props => [];
}

class ChatStartEvent extends ChatEvent {}

class CreatePostEvent extends ChatEvent {
  final String message;

  const CreatePostEvent(this.message);

  @override
  List<Object?> get props => [message];
}

class ChatAuthWithSocketEvent extends ChatEvent {}

class ChatCloseSocketEvent extends ChatEvent {}
