import '../../../domain/entities/user.dart';

abstract class AuthRemoteDataSources{
  Future<User> login(String email,String password);
  Future<User> register(String name, String email, String password);
}

class AuthRemoteDataSourcesImpl extends AuthRemoteDataSources{
  @override
  Future<User> login(String email, String password) async {
    await Future.delayed(Duration(seconds: 1));
    return User(id: "1", name: "Earbaj", email: email);
  }

  @override
  Future<User> register(String name, String email, String password) async {
    await Future.delayed(Duration(seconds: 1));
    return User(id: "2", name: name, email: email);
  }

}