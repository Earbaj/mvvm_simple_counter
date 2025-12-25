import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:simple_mvvm/features/auth/presentation/view/login_screen.dart';
import 'package:simple_mvvm/features/auth/presentation/view/register_screen.dart';

import 'core/di/app_injector.dart';
import 'features/dashboard/Presentation/viewmodels/product_viewmodel.dart';
import 'features/dashboard/Presentation/views/dashboard_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDI();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => GetIt.instance<ProductViewModel>(),
        ),
        // later: AuthViewModel, CartViewModel, etc
      ],
      child: const MyApp(),
    ),
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
        '/dashboard': (context) => DashboardPage(),
        '/register': (context) => RegisterScreen()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}


