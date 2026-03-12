import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sigevappsoportefrontend/domain/models/chat.dart';
import 'package:sigevappsoportefrontend/domain/providers/chat_provider.dart';
import 'package:sigevappsoportefrontend/presentation/pages/home/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final provider = ChatProvider();
  final BuildContext _context;
  TextEditingController controller = TextEditingController();
  HomeCubit({required BuildContext context})
    : _context = context,
      super(HomeInitial());
  void setChat({required Chat chat}) async {
    emit(HomeData(chat: chat));
  }

  void cleanChat() async {
    emit(HomeInitial());
  }

  void showInfoClient() async {
    emit(HomeData(showInfoClient: true, chat: state.chat));
  }

  void hideInfoClient() async {
    emit(HomeData(showInfoClient: false, chat: state.chat));
  }
}
