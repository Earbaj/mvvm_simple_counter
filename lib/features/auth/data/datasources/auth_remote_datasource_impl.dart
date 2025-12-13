import 'package:dio/dio.dart';
import 'package:simple_mvvm/features/auth/data/datasources/auth_remote_datasource.dart';
import '../models/user_model.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImpl(this.dio);

  @override
  Future<(String, UserModel)> register(
      String name,
      String email,
      String password,
      ) async {
    try {
      // Prepare request data
      final requestData = {
        'name': name,
        'email': email,
        'password': password,
      };

      print('📤 Register Request Data: $requestData');

      final response = await dio.post(
        'http://192.168.0.102:5000/api/auth/register',
        data: requestData,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      print('✅ Register Response Status: ${response.statusCode}');
      print('📥 Register Response Data: ${response.data}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Success
        final token = response.data['token']?.toString() ?? '';
        final userJson = response.data['user'];

        print('🔑 Token Received: $token');
        print('👤 User Data: $userJson');

        final user = UserModel.fromJson(userJson);
        return (token, user);
      } else {
        // Server returned error status code
        print('❌ Server Error: ${response.statusCode} - ${response.data}');
        throw Exception('Registration failed: ${response.data['message']}');
      }

    } on DioException catch (e) {
      print('❌ Dio Error: ${e.message}');
      if (e.response != null) {
        print('📥 Error Response: ${e.response!.data}');
      }
      rethrow;
    } catch (e) {
      print('❌ Unexpected Error: $e');
      rethrow;
    }
  }

  @override
  Future<(String, UserModel)> login(
      String email,
      String password
      ) async
  {
    try {
      final requestData = {
        'email': email,
        'password': password,
      };

      print('📤 Login Request Data: $requestData');

      final response = await dio.post(
        'http://192.168.0.102:5000/api/auth/login',
        data: requestData,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      print('✅ Login Response Status: ${response.statusCode}');
      print('📥 Login Response Data: ${response.data}');

      if (response.statusCode == 200) {
        // Success
        final token = response.data['token']?.toString() ?? '';
        final userJson = response.data['user'];

        print('🔑 Token Received: $token');
        print('👤 User Data: $userJson');

        final user = UserModel.fromJson(userJson);
        return (token, user);
      } else {
        // Server returned error status code
        print('❌ Server Error: ${response.statusCode} - ${response.data}');
        throw Exception('Login failed: ${response.data['message']}');
      }

    } on DioException catch (e) {
      print('❌ Dio Error: ${e.message}');
      if (e.response != null) {
        print('📥 Error Response: ${e.response!.data}');
      }
      rethrow;
    } catch (e) {
      print('❌ Unexpected Error: $e');
      rethrow;
    }
  }
}