import 'package:quizapp/src/exports.dart';

class TokenUtil {
  final pref = SharedPreferences.getInstance();

  Future<void> saveToken(String? token) async {
    pref.then(
        (value) => {print("$token saved"), value.setString('token', token!)});
  }

  Future<void> clearToken(String? token) async {
    pref.then((value) => value.remove('token'));
  }

  Future<String?> getToken() async {
    var da = await pref;
    var token = da.getString('token');
    if (token == null) {
      return null;
    } else {
      return token;
    }
  }

  Future<bool> checkToken() async {
    var token = await getToken();
    if (token == null) {
      return false;
    } else {
      return JwtDecoder.isExpired(token);
    }
  }
}
