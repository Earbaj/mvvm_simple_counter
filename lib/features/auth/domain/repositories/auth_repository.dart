import 'package:simple_mvvm/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository{
  Future<(String token, UserEntity user)> register(String name,String emial,String password);
  Future<(String token, UserEntity user)> login(String email,String password);
  Future<void> logout();
}