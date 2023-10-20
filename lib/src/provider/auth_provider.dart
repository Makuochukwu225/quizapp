import '../exports.dart';

class AuthState {
  final bool isAuthenticated;
  final LoginModel? user;
  final String? error;

  AuthState({
    required this.isAuthenticated,
    this.user,
    this.error,
  });

  factory AuthState.initial() {
    return AuthState(isAuthenticated: false);
  }

  factory AuthState.isAuthenticated(LoginModel userData) {
    return AuthState(isAuthenticated: true, user: userData);
  }

  factory AuthState.error(String errorMessage) {
    return AuthState(isAuthenticated: false, error: errorMessage);
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final dio = Dio();
  return AuthNotifier(dio);
});

class AuthNotifier extends StateNotifier<AuthState> {
  final Dio _dio;

  AuthNotifier(this._dio) : super(AuthState.initial());

  Future<void> login(String username, String password) async {
 
    try {
      final response = await _dio.post('${baseurl}login', data: {
        'email': username,
        'password': password,
      });


      state = AuthState.isAuthenticated(LoginModel.fromJson(response.data));
    } catch (error) {
      
      state = AuthState.error('Login failed: $error');
    }
  }

  void logout() {
    state = AuthState.initial();
  }
}
