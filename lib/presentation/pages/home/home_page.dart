import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sigevappsoportefrontend/config/theme/app_theme.dart';
import 'package:sigevappsoportefrontend/presentation/pages/chats/screens/chats_page.dart';
import 'package:sigevappsoportefrontend/presentation/pages/home/cubit/home_cubit.dart';
import 'package:sigevappsoportefrontend/presentation/pages/home/cubit/home_state.dart';
import 'package:sigevappsoportefrontend/presentation/pages/messages/screens/messages_page.dart';
import 'package:sigevappsoportefrontend/presentation/widgets/app_loader.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: AppTheme.neutralColorWhite,
        body: BlocProvider(
          create: (context) => HomeCubit(context: context),
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              switch (state) {
                case HomeError():
                  return Container();
                case HomeLoading():
                  return const AppLoader();
                case HomeData():
                  return Padding(
                    padding: EdgeInsets.all(context.spacing16),
                    child: HomePageBody(),
                  );
                case HomeInitial():
                  return Padding(
                    padding: EdgeInsets.all(context.spacing16),
                    child: HomePageBody(),
                  );
                default:
                  return const AppLoader();
              }
            },
          ),
        ),
      ),
    );
  }
}

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: ChatsPage()),
        SizedBox(width: context.spacing20),
        Expanded(flex: 3, child: MessagesPage()),
      ],
    );
  }
}
