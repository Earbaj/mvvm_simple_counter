import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodel/auth_viewmodel.dart';


class LoginScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<AuthViewModel>();

    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(controller: emailController),
            TextField(controller: passwordController),
            ElevatedButton(
              onPressed: () {
                vm.login(
                  emailController.text,
                  passwordController.text,
                );
              },
              child: Text("Login"),
            ),
            if (vm.loading) CircularProgressIndicator(),
            if (vm.errorMessage != null) Text(vm.errorMessage!),
          ],
        ),
      ),
    );
  }
}
