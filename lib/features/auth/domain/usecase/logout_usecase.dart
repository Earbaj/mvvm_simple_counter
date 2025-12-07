
import 'package:simple_mvvm/features/auth/domain/repositories/auth_repository.dart';

class Logout{
  final AuthRepository repository;
  Logout(this.repository);
  Future<void> call() async {
    return repository.logout();
  }
}