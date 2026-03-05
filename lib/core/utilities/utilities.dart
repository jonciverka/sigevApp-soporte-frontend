import 'package:sigevappsoportefrontend/config/globals.dart' as globals;
import 'package:shared_preferences/shared_preferences.dart';

class Utilities {
  Future<void> clearCache() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    globals.token = '';
    globals.user = null;
  }
}

extension StringExtension on String? {
  String? get capitalize => this == null
      ? null
      : '${this?[0].toUpperCase()}${this?.substring(1).toLowerCase()}';
}

extension StringCapitalize on String {
  String get capitalize =>
      isEmpty ? '' : '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
}
