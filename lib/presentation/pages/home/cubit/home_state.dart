import 'package:sigevappsoportefrontend/domain/models/chat.dart';

abstract class HomeState {
  HomeState({required this.chat});

  final Chat chat;
  HomeState copyWith();
}

class HomeInitial extends HomeState {
  HomeInitial() : super(chat: Chat());

  @override
  HomeState copyWith() => HomeInitial();
}

class HomeLoading extends HomeState {
  HomeLoading({Chat? chat}) : super(chat: chat ?? Chat());

  @override
  HomeState copyWith({Chat? chat}) => HomeLoading(chat: chat ?? this.chat);
}

class HomeData extends HomeState {
  HomeData({required super.chat}) : super();

  @override
  HomeState copyWith({Chat? chat}) => HomeData(chat: chat ?? this.chat);
}

class HomeError extends HomeState {
  HomeError() : super(chat: Chat());

  @override
  HomeState copyWith({Chat? chat}) => HomeError();
}
