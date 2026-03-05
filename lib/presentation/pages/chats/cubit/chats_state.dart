import 'package:sigevappsoportefrontend/domain/models/chat.dart';

abstract class ChatsState {
  ChatsState({required this.chats});

  final List<Chat> chats;
  ChatsState copyWith();
}

class ChatsInitial extends ChatsState {
  ChatsInitial() : super(chats: []);

  @override
  ChatsState copyWith() => ChatsInitial();
}

class ChatsLoading extends ChatsState {
  ChatsLoading({List<Chat>? chats}) : super(chats: chats ?? []);

  @override
  ChatsState copyWith({List<Chat>? chats}) =>
      ChatsLoading(chats: chats ?? this.chats);
}

class ChatsData extends ChatsState {
  ChatsData({required super.chats}) : super();

  @override
  ChatsState copyWith({List<Chat>? chats}) =>
      ChatsData(chats: chats ?? this.chats);
}

class ChatsError extends ChatsState {
  ChatsError() : super(chats: []);

  @override
  ChatsState copyWith({List<Chat>? chats}) => ChatsError();
}
