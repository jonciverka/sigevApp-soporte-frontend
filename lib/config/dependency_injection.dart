import 'package:sigevappsoportefrontend/core/services/api_service.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  // Core
  getIt.registerLazySingleton<ApiService>(() => ApiService());

  // Providers
  // getIt.registerLazySingleton<HomeProvider>(() => HomeProvider());
}
