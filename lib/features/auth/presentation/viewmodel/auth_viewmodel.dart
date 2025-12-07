import 'package:flutter/material.dart';

import '../../domain/entities/user.dart';
import '../../domain/usecase/login_usecases.dart';
import '../../domain/usecase/logout_usecase.dart';
import '../../domain/usecase/register_usecase.dart';

class AuthViewModel extends ChangeNotifier {
  final Login loginUseCase;
  final Register registerUseCase;
  final Logout logoutUseCase;

  User? currentUser;
  bool loading = false;
  String? errorMessage;

  AuthViewModel({
    required this.loginUseCase,
    required this.registerUseCase,
    required this.logoutUseCase,
  });

  Future<void> login(String email, String password) async {
    loading = true;
    notifyListeners();

    try {
      currentUser = await loginUseCase(email, password);
      errorMessage = null;
    } catch (e) {
      errorMessage = e.toString();
    }

    loading = false;
    notifyListeners();
  }

  Future<void> register(String name, String email, String password) async {
    loading = true;
    notifyListeners();

    try {
      currentUser = await registerUseCase(name, email, password);
      errorMessage = null;
    } catch (e) {
      errorMessage = e.toString();
    }

    loading = false;
    notifyListeners();
  }

  Future<void> logout() async {
    await logoutUseCase();
    currentUser = null;
    notifyListeners();
  }
}
