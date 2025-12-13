import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_mvvm/features/auth/presentation/view/login_screen.dart';
import 'package:simple_mvvm/features/auth/presentation/view/register_screen.dart';

import 'core/di/app_injector.dart';
import 'features/auth/presentation/view/dashboard_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDI();

  runApp(
      MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        '/register': (context) => RegisterScreen()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}


