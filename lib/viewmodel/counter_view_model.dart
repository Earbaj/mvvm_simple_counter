import 'package:flutter/material.dart';
import '../model/counter_model.dart';

class CounterViewModel extends ChangeNotifier {
  CounterModel _counter = CounterModel();

  int get counter => _counter.value;

  void increment() {
    _counter.value++;
    notifyListeners();
  }

  void decrement() {
    _counter.value--;
    notifyListeners();
  }

  void reset() {
    _counter.value = 0;
    notifyListeners();
  }
}
