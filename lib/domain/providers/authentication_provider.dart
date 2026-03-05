import 'package:shared_preferences/shared_preferences.dart';
import 'package:sigevappsoportefrontend/config/dependency_injection.dart';
import 'package:sigevappsoportefrontend/config/errors/exceptions.dart';
import 'package:sigevappsoportefrontend/config/globals.dart' as globals;
import 'package:sigevappsoportefrontend/core/constant/local_storage_keys.dart';
import 'package:sigevappsoportefrontend/core/services/api_service.dart';
import 'package:sigevappsoportefrontend/core/utilities/utilities_headers.dart';
import 'package:sigevappsoportefrontend/domain/models/token.dart';
import 'package:sigevappsoportefrontend/domain/repositories/authentication_repository.dart';

class AuthenticationProvider implements AuthenticationRepository {
  final String _loginEndpoint = "login";
  final ApiService _apiService = getIt<ApiService>();
  @override
  Future<void> login({required String login, required String password}) async {
    try {
      final dynamic response = await _apiService.postRequest(_loginEndpoint, {
        'email': login,
        'password': password,
      }, UtilitiesHeaders.getHeaderSinToken());
      Token token = tokenFromJson(response);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(LocalStorageKeys.keyAccesToken, token.accessToken!);
      globals.token = token.accessToken!;
    } on ApiClientException catch (exc) {
      throw exc.message.toString();
    } catch (exc) {
      rethrow;
    }
  }
}
