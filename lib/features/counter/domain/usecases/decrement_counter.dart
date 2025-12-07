
import 'package:simple_mvvm/features/counter/domain/repositories/counter_repository.dart';

class DecrementCounter{
  final CounterRepository repository;
  DecrementCounter(this.repository);
  Future<int> call(int previousValue)async{
    final newValue = previousValue-1;
    await repository.saveCounter(newValue);
    return newValue;
  }
}