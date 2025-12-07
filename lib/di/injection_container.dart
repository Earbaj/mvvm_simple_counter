import 'package:get_it/get_it.dart';
import 'package:simple_mvvm/features/counter/domain/usecases/decrement_counter.dart';
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

  // UseCase
  sl.registerLazySingleton(() => IncrementCounter(sl()));
  sl.registerLazySingleton(() => DecrementCounter(sl()));

  // Repository
  sl.registerLazySingleton<CounterRepository>(
          () => CounterRepositoryImpl(sl())
  );

  // Data Source
  sl.registerLazySingleton<CounterLocalDataSource>(
          () => CounterLocalDataSourceImpl()
  );
}
