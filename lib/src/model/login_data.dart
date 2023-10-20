import 'dart:convert';

class LoginData {
  String? email;
  String? password;
  LoginData({
    this.email,
    this.password,
  });

  LoginData copyWith({
    String? email,
    String? password,
  }) {
    return LoginData(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(email != null){
      result.addAll({'email': email});
    }
    if(password != null){
      result.addAll({'password': password});
    }
  
    return result;
  }

  factory LoginData.fromMap(Map<String, dynamic> map) {
    return LoginData(
      email: map['email'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginData.fromJson(String source) => LoginData.fromMap(json.decode(source));

  @override
  String toString() => 'LoginData(email: $email, password: $password)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is LoginData &&
      other.email == email &&
      other.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}
