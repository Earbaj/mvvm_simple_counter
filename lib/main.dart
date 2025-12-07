import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_mvvm/features/auth/presentation/pages/login_screen.dart';
import 'package:simple_mvvm/features/auth/presentation/viewmodel/auth_viewmodel.dart';

import 'di/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init(); // DI initialization

  runApp(
    ChangeNotifierProvider(
      create: (context) => sl<AuthViewModel>(),
      child: MaterialApp(
        home: LoginScreen(),
      ),
    ),
  );
}

