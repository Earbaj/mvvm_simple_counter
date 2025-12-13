
import 'package:flutter/material.dart';
import 'package:simple_mvvm/features/auth/domain/usecases/login_usecase.dart';
import 'package:simple_mvvm/features/auth/domain/usecases/register_usecase.dart';

import '../../domain/usecases/logout_usecase.dart';
import 'auth_state.dart';

class AuthViewModel extends ChangeNotifier {

  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final LogoutUseCase logoutUseCase;

  AuthState _state = AuthState(AuthStatus.idle);

  bool _isPasswordVisible = false;
  bool _rememberMe = false;

  AuthViewModel({
    required this.loginUseCase,
    required this.registerUseCase,
    required this.logoutUseCase
  });

  // Getters
  bool get isPasswordVisible => _isPasswordVisible;
  bool get rememberMe => _rememberMe;
  AuthState get state => _state;

  // Toggle password visibility
  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  // Toggle remember me
  void toggleRememberMe(bool value) {
    _rememberMe = value;
    notifyListeners();
  }

  Future<void> login(String email, String password) async {
    _state = AuthState(AuthStatus.loading);
    notifyListeners();

    try {
      await loginUseCase(email, password);
      _state = AuthState(AuthStatus.success);
    } catch (e) {
      _state = AuthState(AuthStatus.error, error: e.toString());
    }

    notifyListeners();
  }

  Future<void> register(String name,String email,String password) async {
    _state = AuthState(AuthStatus.loading);
    notifyListeners();
    try{
      await registerUseCase(name,email,password);
      _state = AuthState(AuthStatus.success);
    }catch(e){
      _state = AuthState(AuthStatus.error, error: e.toString());
    }
    notifyListeners();
  }

  Future<void> logout() async {
    await logoutUseCase();
    _state = AuthState(AuthStatus.idle);
    notifyListeners();
  }

}