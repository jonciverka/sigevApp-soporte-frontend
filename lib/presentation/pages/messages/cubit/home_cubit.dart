// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sigevappsoportefrontend/domain/providers/chat_provider.dart';
import 'package:sigevappsoportefrontend/presentation/pages/messages/cubit/home_state.dart';

class MessageCubit extends Cubit<MessageState> {
  final provider = ChatProvider();
  final BuildContext _context;
  TextEditingController controller = TextEditingController();
  MessageCubit({required BuildContext context})
    : _context = context,
      super(MessageData());
}
