import 'package:accounts_protector/core/helper/encryption_helper.dart';
import 'package:accounts_protector/features/accounts/data/accounts_repo.dart';
import 'package:accounts_protector/features/authentication/data/repo/auth_repo.dart';
import 'package:accounts_protector/features/authentication/data/repo/i_auth_repo.dart';
import 'package:accounts_protector/features/platforms/data/repo/i_platform_repo.dart';
import 'package:accounts_protector/features/platforms/data/repo/platform_repo.dart';
import 'package:accounts_protector/features/settings/data/i_settings_repo.dart';
import 'package:accounts_protector/features/settings/data/settings_repo.dart';
import 'package:get_it/get_it.dart';
import '../../features/accounts/data/i_accounts_repo.dart';
import '../helper/cache_helper.dart';
import '../networking/web_services/api_service.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerLazySingleton<IAccountsRepo>(() => AccountsRepo());
  getIt.registerLazySingleton<IPlatformRepo>(() => PlatformRepo());
  getIt.registerLazySingleton<IAuthRepo>(() => AuthRepo());
  getIt.registerLazySingleton<ApiService>(() => ApiService());
  getIt.registerLazySingleton<EncryptionHelper>(() => EncryptionHelper());
  getIt.registerLazySingleton<CacheHelper>(() => CacheHelper());
  getIt.registerLazySingleton<ISettingsRepo>(() => SettingsRepo());
}