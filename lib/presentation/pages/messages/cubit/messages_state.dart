import 'package:sigevappsoportefrontend/domain/models/mensaje.dart';

abstract class MessageState {
  MessageState({required this.chats});

  final List<Mensaje> chats;
  MessageState copyWith();
}

class MessageInitial extends MessageState {
  MessageInitial() : super(chats: []);

  @override
  MessageState copyWith() => MessageInitial();
}

class MessageLoading extends MessageState {
  MessageLoading({List<Mensaje>? chats}) : super(chats: chats ?? []);

  @override
  MessageState copyWith({List<Mensaje>? chats}) =>
      MessageLoading(chats: chats ?? this.chats);
}

class MessageData extends MessageState {
  MessageData({required super.chats}) : super();

  @override
  MessageState copyWith({List<Mensaje>? chats}) =>
      MessageData(chats: chats ?? []);
}

class MessageError extends MessageState {
  MessageError() : super(chats: []);

  @override
  MessageState copyWith({List<Mensaje>? chats}) => MessageError();
}

class MessageEmpty extends MessageState {
  MessageEmpty() : super(chats: []);

  @override
  MessageState copyWith({List<Mensaje>? chats}) => MessageEmpty();
}
