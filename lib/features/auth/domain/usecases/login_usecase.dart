import 'package:simple_mvvm/features/auth/domain/entities/user_entity.dart';
import 'package:simple_mvvm/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase{
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<(String, UserEntity)> call(String email, String password){
    return repository.login(email, password);
  }

}