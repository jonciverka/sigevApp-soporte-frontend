// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:sigevappsoportefrontend/config/errors/exceptions.dart';
import 'package:sigevappsoportefrontend/core/constant/strings.dart';
import 'package:sigevappsoportefrontend/domain/models/chat.dart';
import 'package:sigevappsoportefrontend/domain/providers/chat_provider.dart';
import 'package:sigevappsoportefrontend/presentation/pages/chats/cubit/chats_state.dart';
import 'package:sigevappsoportefrontend/presentation/pages/home/cubit/home_cubit.dart';
import 'package:sigevappsoportefrontend/presentation/widgets/app_toast_notification.dart';

class ChatsCubit extends Cubit<ChatsState> {
  final provider = ChatProvider();
  final BuildContext _context;
  TextEditingController controller = TextEditingController();
  HomeCubit homeCubit;
  ChatsCubit({required BuildContext context, required this.homeCubit})
    : _context = context,
      super(ChatsInitial()) {
    getChats();
  }

  Future<void> getChats() async {
    try {
      emit(ChatsLoading());
      final List<Chat> chats = await provider.obtenerChats();
      emit(ChatsData(chats: chats));
    } on ServerErrorException {
      showToastNotification(
        context: _context,
        message: AppLocale.error.getString(_context),
        type: ToastType.error,
      );
      emit(ChatsLoading());
      return;
    } on NetworkException {
      showToastNotification(
        context: _context,
        message: AppLocale.avisoSinInternet.getString(_context),
        type: ToastType.error,
      );
      emit(ChatsLoading());
      return;
    } on ApiClientException catch (e) {
      showToastNotification(
        context: _context,
        message: e.message,
        type: ToastType.error,
      );
      emit(ChatsLoading());
      return;
    } catch (e) {
      showToastNotification(
        context: _context,
        message: AppLocale.error.getString(_context),
        type: ToastType.error,
      );
      emit(ChatsLoading());
      return;
    }
  }
}
