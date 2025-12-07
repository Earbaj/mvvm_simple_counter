
abstract class LocalDataSource{
  Future<void> saveToken(String token);
  Future<void> clearToken();
}

class LocalDataSourceImp extends LocalDataSource{
  String? token;

  @override
  Future<void> clearToken() async {
    token = null;
  }

  @override
  Future<void> saveToken(String token) async {
    this.token = token;
  }

}