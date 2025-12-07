
import 'package:simple_mvvm/features/auth/domain/repositories/auth_repository.dart';

import '../entities/user.dart';

class Register{
  final AuthRepository repository;
  Register(this.repository);
  Future<User> call(String name,String email, String password) async {
    return repository.register(name, email, password);
  }
}