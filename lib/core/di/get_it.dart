import 'package:accounts_protector/core/services/encryption_service.dart';
import 'package:accounts_protector/core/session_db/session_db.dart';
import 'package:accounts_protector/features/account/logic/account_cubit.dart';
import 'package:accounts_protector/features/authentication/data/repo/auth_repo.dart';
import 'package:accounts_protector/features/authentication/data/repo/i_auth_repo.dart';
import 'package:accounts_protector/features/authentication/logic/forgot_password/forgot_password_cubit.dart';
import 'package:accounts_protector/features/authentication/logic/login/login_cubit.dart';
import 'package:accounts_protector/features/authentication/logic/register/register_cubit.dart';
import 'package:accounts_protector/features/home/data/home_repo.dart';
import 'package:accounts_protector/features/home/data/i_home_repo.dart';
import 'package:accounts_protector/features/home/logic/home_cubit.dart';
import 'package:accounts_protector/features/pin/logic/pin_cubit.dart';
import 'package:accounts_protector/features/settings/data/i_settings_repo.dart';
import 'package:accounts_protector/features/settings/data/settings_repo.dart';
import 'package:accounts_protector/features/settings/logic/settings_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../features/account/data/account_repo.dart';
import '../../features/account/data/i_accounts_repo.dart';
import '../../features/account/logic/account_crud_cubit.dart';
import '../../features/pin/logic/create_pin_cubit.dart';
import '../../features/platform/data/repo/i_platform_repo.dart';
import '../../features/platform/data/repo/platform_repo.dart';
import '../../features/platform/logic/platform_crud_cubit.dart';
import '../../features/platform/logic/platform_cubit.dart';
import '../networking/web_services/dio_service.dart';
import '../services/cache_service.dart';
import '../networking/web_services/api_service.dart';

final getIt = GetIt.instance;


void setupGetIt() {
  Dio dio = DioService.dio;
  SessionDb sessionDb = SessionDb.instance;

  // networking
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // accounts feature
  getIt.registerLazySingleton<IAccountsRepo>(() => AccountRepo(getIt(), sessionDb));
  getIt.registerFactory<AccountCrudCubit>(() => AccountCrudCubit(getIt()));
  getIt.registerFactory<AccountCubit>(() => AccountCubit());

  // platforms feature
  getIt.registerLazySingleton<IPlatformRepo>(() => PlatformRepo(getIt(), sessionDb));
  getIt.registerFactory<PlatformCubit>(() => PlatformCubit());
  getIt.registerFactory<PlatformCrudCubit>(() => PlatformCrudCubit(getIt()));

  // authentication feature
  getIt.registerLazySingleton<IAuthRepo>(() => AuthRepo(getIt()));

  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  getIt.registerFactory<RegisterCubit>(() => RegisterCubit(getIt()));
  getIt.registerFactory<CreatePinCubit>(() => CreatePinCubit(getIt()));
  getIt.registerFactory<PinCubit>(() => PinCubit());
  getIt.registerFactory<ForgotPasswordCubit>(() => ForgotPasswordCubit(getIt()));

  // settings feature
  getIt.registerFactory<SettingsCubit>(() => SettingsCubit(getIt()));
  getIt.registerLazySingleton<ISettingsRepo>(() => SettingsRepo(sessionDb));

  // home feature
  getIt.registerLazySingleton<IHomeRepo>(() => HomeRepo(getIt(), sessionDb));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));


  // services
  getIt.registerLazySingleton<EncryptionService>(() => EncryptionService());
  getIt.registerLazySingleton<CacheService>(() => CacheService());
}