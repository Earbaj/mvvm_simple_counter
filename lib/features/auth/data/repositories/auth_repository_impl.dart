import 'package:simple_mvvm/core/storage/token_storage.dart';
import 'package:simple_mvvm/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:simple_mvvm/features/auth/domain/entities/user_entity.dart';
import 'package:simple_mvvm/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository{
  final AuthRemoteDataSource remoteDataSource;
  final TokenStorage tokenStorage;

  AuthRepositoryImpl(this.remoteDataSource,this.tokenStorage);

  @override
  Future<(String, UserEntity)> login(String email, String password) async{
    final result = await remoteDataSource.login(email, password);
    await tokenStorage.saveToken(result.$1);
    return result;
  }

  @override
  Future<(String, UserEntity)> register(String name, String email, String password) async{
    final result = await remoteDataSource.register(name, email, password);
    await tokenStorage.saveToken(result.$1);
    return result;
  }

  @override
  Future<void> logout() async {
    await tokenStorage.clear();
  }

}