import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sigevappsoportefrontend/config/globals.dart' as globals;
import 'package:sigevappsoportefrontend/core/constant/assets_constants.dart';
import 'package:sigevappsoportefrontend/core/constant/local_storage_keys.dart';
import 'package:sigevappsoportefrontend/core/constant/screen_paths.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => asyncInitState());
  }

  void asyncInitState() async {
    try {
      var token = "";
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(LocalStorageKeys.keyAccesToken, token);
      globals.token = token;
    } catch (mensaje) {
      if (mounted) {
        context.go(ScreenPaths.homeRoute);
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        margin: const EdgeInsets.all(0),
        alignment: Alignment.topCenter,
        child: Center(child: Image.asset(AssetsConstants.sigevLogo)),
      ),
    );
  }
}
