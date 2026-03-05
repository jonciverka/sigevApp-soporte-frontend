// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:sigevappsoportefrontend/config/errors/exceptions.dart';
import 'package:sigevappsoportefrontend/core/constant/strings.dart';
import 'package:sigevappsoportefrontend/domain/models/chat.dart';
import 'package:sigevappsoportefrontend/domain/providers/chat_provider.dart';
import 'package:sigevappsoportefrontend/presentation/pages/home/cubit/home_state.dart';
import 'package:sigevappsoportefrontend/presentation/widgets/app_toast_notification.dart';

class HomeCubit extends Cubit<HomeState> {
  final provider = ChatProvider();
  final BuildContext _context;
  HomeCubit({required BuildContext context})
    : _context = context,
      super(HomeInitial()) {
    getTramiteCliente();
  }
  Future<void> getTramiteCliente() async {
    try {
      emit(HomeLoading());
      final List<Chat> chats = await provider.obtenerChats();
      emit(HomeData(chats: chats));
    } on ServerErrorException {
      showToastNotification(
        context: _context,
        message: AppLocale.error.getString(_context),
        type: ToastType.error,
      );
      emit(HomeLoading());
      return;
    } on NetworkException {
      showToastNotification(
        context: _context,
        message: AppLocale.avisoSinInternet.getString(_context),
        type: ToastType.error,
      );
      emit(HomeLoading());
      return;
    } on ApiClientException catch (e) {
      showToastNotification(
        context: _context,
        message: e.message,
        type: ToastType.error,
      );
      emit(HomeLoading());
      return;
    } catch (e) {
      showToastNotification(
        context: _context,
        message: AppLocale.error.getString(_context),
        type: ToastType.error,
      );
      emit(HomeLoading());
      return;
    }
  }
}
