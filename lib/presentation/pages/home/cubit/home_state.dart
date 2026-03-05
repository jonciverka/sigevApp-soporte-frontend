import 'package:sigevappsoportefrontend/domain/models/chat.dart';

abstract class HomeState {
  HomeState({required this.chats});

  final List<Chat> chats;
  HomeState copyWith();
}

class HomeInitial extends HomeState {
  HomeInitial() : super(chats: []);

  @override
  HomeState copyWith() => HomeInitial();
}

class HomeLoading extends HomeState {
  HomeLoading({List<Chat>? chats}) : super(chats: chats ?? []);

  @override
  HomeState copyWith({List<Chat>? chats}) =>
      HomeLoading(chats: chats ?? this.chats);
}

class HomeData extends HomeState {
  HomeData({required super.chats}) : super();

  @override
  HomeState copyWith({List<Chat>? chats}) =>
      HomeData(chats: chats ?? this.chats);
}

class HomeError extends HomeState {
  HomeError() : super(chats: []);

  @override
  HomeState copyWith({List<Chat>? chats}) => HomeError();
}
