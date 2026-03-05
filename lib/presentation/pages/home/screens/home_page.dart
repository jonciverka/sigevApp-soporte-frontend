import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sigevappsoportefrontend/config/theme/app_theme.dart';
import 'package:sigevappsoportefrontend/core/constant/assets_constants.dart';
import 'package:sigevappsoportefrontend/presentation/pages/home/cubit/home_cubit.dart';
import 'package:sigevappsoportefrontend/presentation/pages/home/cubit/home_state.dart';
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
                  return HomePageBody();
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
    var homeCubit = context.watch<HomeCubit>();
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          child: Opacity(
            opacity: .1,
            child: Image.asset(AssetsConstants.flechaLoco),
          ),
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            
          ],
        ),
      ],
    );
  }
}
