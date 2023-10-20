class QuestionModel {
final bool? status;
final String? message;
final List<Question>? data;
const QuestionModel({this.status , this.message , this.data });
QuestionModel copyWith({bool? status, String? message, List<Question>? data}){
return QuestionModel(
            status:status ?? this.status,
message:message ?? this.message,
data:data ?? this.data
        );
        }
        
Map<String,Object?> toJson(){
    return {
            'status': status,
'message': message,
'data': data?.map<Map<String,dynamic>>((data)=> data.toJson()).toList()
    };
}

static QuestionModel fromJson(Map<String , Object?> json){
    return QuestionModel(
            status:json['status'] == null ? null : json['status'] as bool,
message:json['message'] == null ? null : json['message'] as String,
data:json['data'] == null ? null : (json['data'] as List).map<Question>((data)=> Question.fromJson(data  as Map<String,Object?>)).toList()
    );
}

@override
String toString(){
    return '''QuestionModel(
                status:$status,
message:$message,
data:${data.toString()}
    ) ''';
}

@override
bool operator ==(Object other){
    return other is QuestionModel && 
        other.runtimeType == runtimeType &&
        other.status == status && 
other.message == message && 
other.data == data;
}
      
@override
int get hashCode {
    return Object.hash(
                runtimeType,
                status, 
message, 
data
    );
}
    
}
      
      
class Question {
final String? id;
final String? questionText;
final List<Option>? options;
final String? createdAt;
final String? updatedAt;
final int? V;
const Question({this.id , this.questionText , this.options , this.createdAt , this.updatedAt , this.V });
Question copyWith({String? id, String? questionText, List<Option>? options, String? createdAt, String? updatedAt, int? V}){
return Question(
            id:id ?? this.id,
questionText:questionText ?? this.questionText,
options:options ?? this.options,
createdAt:createdAt ?? this.createdAt,
updatedAt:updatedAt ?? this.updatedAt,
V:V ?? this.V
        );
        }
        
Map<String,Object?> toJson(){
    return {
            '_id': id,
'questionText': questionText,
'options': options?.map<Map<String,dynamic>>((data)=> data.toJson()).toList(),
'createdAt': createdAt,
'updatedAt': updatedAt,
'__v': V
    };
}

static Question fromJson(Map<String , Object?> json){
    return Question(
            id:json['_id'] == null ? null : json['_id'] as String,
questionText:json['questionText'] == null ? null : json['questionText'] as String,
options:json['options'] == null ? null : (json['options'] as List).map<Option>((data)=> Option.fromJson(data  as Map<String,Object?>)).toList(),
createdAt:json['createdAt'] == null ? null : json['createdAt'] as String,
updatedAt:json['updatedAt'] == null ? null : json['updatedAt'] as String,
V:json['__v'] == null ? null : json['__v'] as int
    );
}

@override
String toString(){
    return '''Data(
                id:$id,
questionText:$questionText,
options:${options.toString()},
createdAt:$createdAt,
updatedAt:$updatedAt,
V:$V
    ) ''';
}

@override
bool operator ==(Object other){
    return other is Question && 
        other.runtimeType == runtimeType &&
        other.id == id && 
other.questionText == questionText && 
other.options == options && 
other.createdAt == createdAt && 
other.updatedAt == updatedAt && 
other.V == V;
}
      
@override
int get hashCode {
    return Object.hash(
                runtimeType,
                id, 
questionText, 
options, 
createdAt, 
updatedAt, 
V
    );
}
    
}
      
      
class Option {
final String? text;
final bool? isCorrect;
final String? id;
const Option({this.text , this.isCorrect , this.id });
Option copyWith({String? text, bool? isCorrect, String? id}){
return Option(
            text:text ?? this.text,
isCorrect:isCorrect ?? this.isCorrect,
id:id ?? this.id
        );
        }
        
Map<String,Object?> toJson(){
    return {
            'text': text,
'isCorrect': isCorrect,
'_id': id
    };
}

static Option fromJson(Map<String , Object?> json){
    return Option(
            text:json['text'] == null ? null : json['text'] as String,
isCorrect:json['isCorrect'] == null ? null : json['isCorrect'] as bool,
id:json['_id'] == null ? null : json['_id'] as String
    );
}

@override
String toString(){
    return '''Options(
                text:$text,
isCorrect:$isCorrect,
id:$id
    ) ''';
}

@override
bool operator ==(Object other){
    return other is Option && 
        other.runtimeType == runtimeType &&
        other.text == text && 
other.isCorrect == isCorrect && 
other.id == id;
}
      
@override
int get hashCode {
    return Object.hash(
                runtimeType,
                text, 
isCorrect, 
id
    );
}
    
}
      
      
  
     