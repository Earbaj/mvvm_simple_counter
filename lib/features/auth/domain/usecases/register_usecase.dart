import 'package:simple_mvvm/features/auth/domain/entities/user_entity.dart';
import 'package:simple_mvvm/features/auth/domain/repositories/auth_repository.dart';

class RegisterUseCase{
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  Future<(String, UserEntity)> call(String name,String email,String password){
    return repository.register(name, email, password);
  }

}