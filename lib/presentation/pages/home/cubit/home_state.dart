import 'package:sigevappsoportefrontend/domain/models/chat.dart';

abstract class HomeState {
  HomeState({required this.chat, this.showInfoClient = false});

  final Chat chat;
  final bool showInfoClient;
  HomeState copyWith();
}

class HomeInitial extends HomeState {
  HomeInitial() : super(chat: Chat(), showInfoClient: false);

  @override
  HomeState copyWith() => HomeInitial();
}

class HomeLoading extends HomeState {
  HomeLoading({Chat? chat, bool? showInfoClient})
    : super(chat: chat ?? Chat(), showInfoClient: showInfoClient ?? false);

  @override
  HomeState copyWith({Chat? chat, bool? showInfoClient}) => HomeLoading(
    chat: chat ?? this.chat,
    showInfoClient: showInfoClient ?? this.showInfoClient,
  );
}

class HomeData extends HomeState {
  HomeData({required super.chat, super.showInfoClient}) : super();

  @override
  HomeState copyWith({Chat? chat, bool? showInfoClient}) => HomeData(
    chat: chat ?? this.chat,
    showInfoClient: showInfoClient ?? this.showInfoClient,
  );
}

class HomeError extends HomeState {
  HomeError() : super(chat: Chat(), showInfoClient: false);

  @override
  HomeState copyWith({Chat? chat, bool? showInfoClient}) => HomeError();
}
