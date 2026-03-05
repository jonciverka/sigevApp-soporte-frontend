abstract class MessageState {
  MessageState();

  MessageState copyWith();
}

class MessageInitial extends MessageState {
  MessageInitial() : super();

  @override
  MessageState copyWith() => MessageInitial();
}

class MessageLoading extends MessageState {
  MessageLoading() : super();

  @override
  MessageState copyWith() => MessageLoading();
}

class MessageData extends MessageState {
  MessageData() : super();

  @override
  MessageState copyWith() => MessageData();
}

class MessageError extends MessageState {
  MessageError() : super();

  @override
  MessageState copyWith() => MessageError();
}
