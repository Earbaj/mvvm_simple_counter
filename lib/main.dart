import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_mvvm/viewmodel/counter_view_model.dart';
import 'view/counter_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CounterViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CounterScreen(),
      ),
    ),
  );
}
