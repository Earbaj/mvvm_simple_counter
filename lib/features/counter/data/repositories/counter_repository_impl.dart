import '../../domain/repositories/counter_repository.dart';
import '../datasources/counter_local_datasource.dart';

class CounterRepositoryImpl implements CounterRepository {
  final CounterLocalDataSource localDataSource;

  CounterRepositoryImpl(this.localDataSource);

  @override
  Future<int> loadCounter() => localDataSource.load();

  @override
  Future<void> saveCounter(int value) => localDataSource.save(value);
}
