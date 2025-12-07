
import 'package:simple_mvvm/features/auth/data/datasources/local/local_data_sources.dart';
import 'package:simple_mvvm/features/auth/data/datasources/remote/remote_data_aource.dart';
import 'package:simple_mvvm/features/auth/domain/entities/user.dart';
import 'package:simple_mvvm/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImp extends AuthRepository{
  final LocalDataSource localDataSource;
  final AuthRemoteDataSources remoteDataSources;

  AuthRepositoryImp(this.localDataSource,this.remoteDataSources);

  @override
  Future<User> login(String email, String password) async {
   final user = await remoteDataSources.login(email, password);
   await localDataSource.saveToken("dummy-token-login");
   return user;
  }

  @override
  Future<void> logout() async {
    await localDataSource.clearToken();
  }

  @override
  Future<User> register(String name, String email, String password) async {
    final user = await remoteDataSources.register(name, email, password);
    await localDataSource.saveToken("dummy-token-register");
    return user;
  }

}