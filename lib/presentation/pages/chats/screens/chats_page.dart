import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:sigevappsoportefrontend/config/theme/app_theme.dart';
import 'package:sigevappsoportefrontend/core/constant/strings.dart';
import 'package:sigevappsoportefrontend/presentation/pages/chats/cubit/chats_cubit.dart';
import 'package:sigevappsoportefrontend/presentation/pages/chats/cubit/chats_state.dart';
import 'package:sigevappsoportefrontend/presentation/pages/chats/widget/app_card_tramite.dart';
import 'package:sigevappsoportefrontend/presentation/pages/home/cubit/home_cubit.dart';
import 'package:sigevappsoportefrontend/presentation/widgets/app_inputs.dart';
import 'package:sigevappsoportefrontend/presentation/widgets/app_loader.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatsCubit(context: context),
      child: BlocBuilder<ChatsCubit, ChatsState>(
        builder: (context, state) {
          switch (state) {
            case ChatsError():
              return Container();
            case ChatsLoading():
              return const AppLoader();
            case ChatsData():
              return ChatsPageBody();
            default:
              return const AppLoader();
          }
        },
      ),
    );
  }
}

class ChatsPageBody extends StatelessWidget {
  const ChatsPageBody({super.key});
  @override
  Widget build(BuildContext context) {
    var chatsCubit = context.watch<ChatsCubit>();
    var homeCubit = context.read<HomeCubit>();
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.spacing16,
        vertical: context.spacing32,
      ),
      decoration: BoxDecoration(
        color: AppTheme.primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          AppTextFormField(
            onChanged: (value) {},
            validator: (value) {
              return null;
            },
            controller: chatsCubit.controller,
            labelText: AppLocale.buscar.getString(context),
          ),
          SizedBox(height: context.spacing16),
          ...chatsCubit.state.chats.map(
            (chat) => AppCardTramite(
              chat: chat,
              onDeletePressed: () => homeCubit.setChat(chat: chat),
            ),
          ),
        ],
      ),
    );
  }
}
