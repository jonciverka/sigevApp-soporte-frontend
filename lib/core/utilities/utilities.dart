import 'package:intl/intl.dart';
import 'package:sigevappsoportefrontend/config/globals.dart' as globals;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sigevappsoportefrontend/core/constant/api_constants.dart';

class Utilities {
  Future<void> clearCache() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    globals.token = '';
    globals.user = null;
  }

  String formatDate(DateTime date) {
    final now = DateTime.now();
    final yesterday = now.subtract(const Duration(days: 1));
    final difference = now.difference(date);

    bool isSameDay(DateTime a, DateTime b) {
      return a.year == b.year && a.month == b.month && a.day == b.day;
    }

    if (isSameDay(now, date)) {
      // Hoy -> solo hora
      return DateFormat('HH:mm').format(date);
    } else if (isSameDay(yesterday, date)) {
      // Ayer
      return "Ayer";
    } else if (difference.inDays < 7) {
      // Menos de una semana -> día de la semana
      return DateFormat('EEEE', 'es').format(date);
    } else {
      // Más de una semana -> dd/mm/yy
      return DateFormat('dd/MM/yy').format(date);
    }
  }

  getURLImage(String? path, {bool isChat = false}) {
    return "${isChat ? ApiConstants.protocolChat : ApiConstants.protocol}${isChat ? ApiConstants.urlBaseChat : ApiConstants.urlBase}${ApiConstants.url}${ApiConstants.apiGetImages}/$path";
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
