import 'package:flutter/material.dart';
import 'package:sigevappsoportefrontend/config/dependency_injection.dart' as di;
import 'package:sigevappsoportefrontend/config/theme/app_theme.dart';
import 'package:sigevappsoportefrontend/core/constant/strings.dart';
import 'package:sigevappsoportefrontend/core/navigation/routes.dart';
import 'package:flutter_localization/flutter_localization.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterLocalization.instance.ensureInitialized();
  di.setupServiceLocator();

  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final FlutterLocalization _localization = FlutterLocalization.instance;
  @override
  void initState() {
    _localization.init(
      mapLocales: [const MapLocale('es', AppLocale.ES, countryCode: 'es_ES')],
      initLanguageCode: 'es',
    );
    _localization.onTranslatedLanguage = _onTranslatedLanguage;
    super.initState();
  }

  void _onTranslatedLanguage(Locale? locale) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Sighev App Support',
      supportedLocales: _localization.supportedLocales,
      localizationsDelegates: _localization.localizationsDelegates,
      theme: AppTheme.getAppTheme(context),
      routerConfig: router,
    );
  }
}
