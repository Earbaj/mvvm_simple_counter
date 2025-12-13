import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<(String token, UserModel user)> register(
      String name,
      String email,
      String password,
      );


  Future<(String token, UserModel user)> login(
      String email,
      String password,
      );
}