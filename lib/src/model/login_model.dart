class LoginModel {
final bool? status;
final String? success;
final String? token;
const LoginModel({this.status , this.success , this.token });
LoginModel copyWith({bool? status, String? success, String? token}){
return LoginModel(
            status:status ?? this.status,
success:success ?? this.success,
token:token ?? this.token
        );
        }
        
Map<String,Object?> toJson(){
    return {
            'status': status,
'success': success,
'token': token
    };
}

static LoginModel fromJson(Map<String , Object?> json){
    return LoginModel(
            status:json['status'] == null ? null : json['status'] as bool,
success:json['success'] == null ? null : json['success'] as String,
token:json['token'] == null ? null : json['token'] as String
    );
}

@override
String toString(){
    return '''LoginModel(
                status:$status,
success:$success,
token:$token
    ) ''';
}

@override
bool operator ==(Object other){
    return other is LoginModel && 
        other.runtimeType == runtimeType &&
        other.status == status && 
other.success == success && 
other.token == token;
}
      
@override
int get hashCode {
    return Object.hash(
                runtimeType,
                status, 
success, 
token
    );
}
    
}
      
      
  
     