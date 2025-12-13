import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:simple_mvvm/features/auth/domain/usecases/logout_usecase.dart';

import '../../features/auth/data/datasources/auth_remote_datasource.dart';
import '../../features/auth/data/datasources/auth_remote_datasource_impl.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/usecases/login_usecase.dart';
import '../../features/auth/domain/usecases/register_usecase.dart';
import '../../features/auth/presentation/viewmodels/auth_viewmodel.dart';
import '../storage/token_storage.dart';

final sl = GetIt.instance; // service locator

Future<void> setupDI() async {
  // External
  sl.registerLazySingleton<Dio>(() => Dio(
    BaseOptions(
      baseUrl: "http://192.168.0.102:5000",
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  ));

  sl.registerLazySingleton<TokenStorage>(() => TokenStorage());

  // Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImpl(sl<Dio>()),
  );

  // Repository
  sl.registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(
            sl<AuthRemoteDataSource>(),
          sl<TokenStorage>()
        ),
  );

  // Use cases
  sl.registerLazySingleton<LoginUseCase>(
        () => LoginUseCase(sl<AuthRepository>()),
  );

  sl.registerLazySingleton<RegisterUseCase>(
        () => RegisterUseCase(sl<AuthRepository>()),
  );

  sl.registerLazySingleton<LogoutUseCase>(
        () => LogoutUseCase(sl<AuthRepository>()),
  );

  // ViewModel (NOT singleton)
  sl.registerFactory<AuthViewModel>(
        () => AuthViewModel(
      loginUseCase: sl<LoginUseCase>(),
      registerUseCase: sl<RegisterUseCase>(),
            logoutUseCase: sl<LogoutUseCase>()
    ),
  );
}