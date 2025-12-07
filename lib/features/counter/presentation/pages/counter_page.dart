import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/counter_viewmodel.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final vm = context.watch<CounterViewModel>();

    return Scaffold(
      appBar: AppBar(title: Text("Clean Counter")),
      body: Center(
        child: Column(
          children: [
            Text(
              vm.value.toString(),
              style: TextStyle(fontSize: 40),
            ),
            IconButton(onPressed: (){
              vm.decrement();
            }, icon: Icon(Icons.remove_circle))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: vm.increment,
        child: Icon(Icons.add),
      ),
    );
  }
}
