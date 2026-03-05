import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sigevappsoportefrontend/config/theme/app_theme.dart';
import 'package:sigevappsoportefrontend/presentation/pages/home/cubit/home_cubit.dart';
import 'package:sigevappsoportefrontend/presentation/pages/messages/cubit/home_cubit.dart';
import 'package:sigevappsoportefrontend/presentation/pages/messages/cubit/home_state.dart';
import 'package:sigevappsoportefrontend/presentation/pages/messages/widgets/app_header_chat.dart';
import 'package:sigevappsoportefrontend/presentation/widgets/app_loader.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MessageCubit(context: context),
      child: BlocBuilder<MessageCubit, MessageState>(
        builder: (context, state) {
          switch (state) {
            case MessageError():
              return Container();
            case MessageLoading():
              return const AppLoader();
            case MessageData():
              return MessagePageBody();
            default:
              return const AppLoader();
          }
        },
      ),
    );
  }
}

class MessagePageBody extends StatelessWidget {
  const MessagePageBody({super.key});
  @override
  Widget build(BuildContext context) {
    var homeCubit = context.read<HomeCubit>();
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: AppTheme.neutralColorBg,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(context.spacing16),
        child: Column(children: [AppHeaderChat(chat: homeCubit.state.chat)]),
      ),
    );
  }
}
