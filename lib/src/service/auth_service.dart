import '../exports.dart';

class AuthService {
  final Dio dio = Dio();
  AuthService(Dio read);
  Future<LoginModel?> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dio.post('${baseurl}login', data: {
        "email": email,
        "password": password,
      
      } );
      print(response.statusCode);
      if (response.statusCode == 200) {
        return LoginModel.fromJson(response.data);
      } else {
        throw DioException(requestOptions: response.requestOptions);
      }
    } on Exception catch (e) {
      print(e);
      throw Exception(e);
    }
  }
}
