import 'package:flutter/material.dart';
import 'package:simple_mvvm/features/counter/domain/usecases/decrement_counter.dart';
import '../../domain/usecases/increment_counter.dart';
import '../../domain/repositories/counter_repository.dart';

class CounterViewModel extends ChangeNotifier {
  final IncrementCounter incrementCounter;
  final DecrementCounter decrementCounter;
  final CounterRepository repository;

  int value = 0;

  CounterViewModel({
    required this.incrementCounter,
    required this.decrementCounter,
    required this.repository,
  });

  Future<void> load() async {
    value = await repository.loadCounter();
    notifyListeners();
  }

  Future<void> increment() async {
    value = await incrementCounter(value);
    notifyListeners();
  }

  Future<void> decrement()async{
    value = await decrementCounter(value);
    notifyListeners();
  }
}
