import 'package:flutter/widgets.dart';
import 'package:sigevappsoportefrontend/core/constant/screen_paths.dart';
import 'package:go_router/go_router.dart';
import 'package:sigevappsoportefrontend/presentation/pages/home/home_page.dart';
import 'package:sigevappsoportefrontend/presentation/splash_page.dart';

final GoRouter router = GoRouter(
  debugLogDiagnostics: true,
  routerNeglect: true,
  initialLocation: ScreenPaths.splashRoute,
  routes: [
    GoRoute(
      path: ScreenPaths.splashRoute,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: SplashScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
      ),
    ),
    GoRoute(
      path: ScreenPaths.homeRoute,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: HomePage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
      ),
    ),
  ],
);
