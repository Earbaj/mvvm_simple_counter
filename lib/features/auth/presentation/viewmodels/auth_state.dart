
enum AuthStatus { idle, loading, success, error }

class AuthState {
  final AuthStatus status;
  final String? error;


  AuthState(this.status, {this.error});
}