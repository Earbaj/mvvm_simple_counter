import 'package:get_it/get_it.dart';
import 'package:simple_mvvm/features/auth/data/repositories/auth_repository_impplementation.dart';
import 'package:simple_mvvm/features/auth/domain/repositories/auth_repository.dart';
import 'package:simple_mvvm/features/auth/domain/usecase/login_usecases.dart';
import 'package:simple_mvvm/features/auth/domain/usecase/register_usecase.dart';
import 'package:simple_mvvm/features/auth/presentation/viewmodel/auth_viewmodel.dart';
import 'package:simple_mvvm/features/counter/domain/usecases/decrement_counter.dart';
import '../features/auth/data/datasources/local/local_data_sources.dart';
import '../features/auth/data/datasources/remote/remote_data_aource.dart';
import '../features/auth/domain/usecase/logout_usecase.dart';
import '../features/counter/data/datasources/counter_local_datasource.dart';
import '../features/counter/data/repositories/counter_repository_impl.dart';
import '../features/counter/domain/repositories/counter_repository.dart';
import '../features/counter/domain/usecases/increment_counter.dart';
import '../features/counter/presentation/viewmodel/counter_viewmodel.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // ViewModel
  sl.registerFactory(() =>
      CounterViewModel(
        incrementCounter: sl(),
        decrementCounter: sl(),
        repository: sl(),
      )
  );

  sl.registerFactory(()=>
      AuthViewModel(
          loginUseCase: sl(),
          registerUseCase: sl(),
          logoutUseCase: sl()
      )
  );

  // UseCase
  sl.registerLazySingleton(() => IncrementCounter(sl()));
  sl.registerLazySingleton(() => DecrementCounter(sl()));

  sl.registerLazySingleton(() => Login(sl()));
  sl.registerLazySingleton(() => Register(sl()));
  sl.registerLazySingleton(() => Logout(sl()));

  // Repository
  sl.registerLazySingleton<CounterRepository>(
          () => CounterRepositoryImpl(sl())
  );
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImp(sl(), sl())
  );

  // Data Source
  sl.registerLazySingleton<CounterLocalDataSource>(
          () => CounterLocalDataSourceImpl()
  );
  sl.registerLazySingleton<LocalDataSource>(
      () => LocalDataSourceImp()
  );
  sl.registerLazySingleton<AuthRemoteDataSources>(
          () => AuthRemoteDataSourcesImpl()
  );
}
