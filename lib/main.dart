import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'di/injection_container.dart';
import 'features/counter/presentation/pages/counter_page.dart';
import 'features/counter/presentation/viewmodel/counter_viewmodel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init(); // DI initialization

  runApp(
    ChangeNotifierProvider(
      create: (context) => sl<CounterViewModel>()..load(),
      child: MaterialApp(
        home: CounterPage(),
      ),
    ),
  );
}

