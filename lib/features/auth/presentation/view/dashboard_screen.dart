import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/di/app_injector.dart';
import '../../../auth/presentation/viewmodels/auth_viewmodel.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => sl<AuthViewModel>(),
      child: Consumer<AuthViewModel>(
        builder: (context, vm, _) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Dashboard'),
              actions: [
                IconButton(
                  icon: const Icon(Icons.logout),
                  onPressed: () async {
                    await vm.logout();
                    // 🔴 CLEAR NAV STACK
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/',
                          (route) => false,
                    );
                  },
                )
              ],
            ),
            body: const Center(
              child: Text(
                'You are logged in 🎉',
                style: TextStyle(fontSize: 18),
              ),
            ),
          );
        },
      ),
    );
  }
}
