import '../repositories/counter_repository.dart';

class IncrementCounter {
  final CounterRepository repository;

  IncrementCounter(this.repository);

  Future<int> call(int currentValue) async {
    final newValue = currentValue + 1;
    await repository.saveCounter(newValue);
    return newValue;
  }
}
