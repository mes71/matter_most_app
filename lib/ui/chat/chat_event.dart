part of 'chat_bloc.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();
}

class ChatStartEvent extends ChatEvent {
  @override
  List<Object?> get props => [];
}

class CreatePostEvent extends ChatEvent {
  final String message;

  const CreatePostEvent(this.message);

  @override
  List<Object> get props => [message];
}

class ChatAuthWithSocketEvent extends ChatEvent {
  @override
  List<Object?> get props => [];
}

class ChatCloseSocketEvent extends ChatEvent {
  @override
  List<Object?> get props => [];
}
