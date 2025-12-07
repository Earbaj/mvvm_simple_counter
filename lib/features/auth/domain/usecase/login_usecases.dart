
import 'package:simple_mvvm/features/auth/domain/repositories/auth_repository.dart';

import '../entities/user.dart';

class Login{
  final AuthRepository repository;
  Login(this.repository);
  Future<User> call(String email,String password) async {
    return repository.login(email, password);
  }
}