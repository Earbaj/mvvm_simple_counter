import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodel/counter_view_model.dart';

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CounterViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text('MVVM Counter')),
      body: Center(
        child: Text(
          '${viewModel.counter}',
          style: TextStyle(fontSize: 40),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: viewModel.increment,
            child: Icon(Icons.add),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: viewModel.decrement,
            child: Icon(Icons.remove),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: viewModel.reset,
            child: Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}
