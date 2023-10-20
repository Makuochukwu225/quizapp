import 'package:quizapp/src/exports.dart';

class QuestionService {
  final Dio dio = Dio();

  QuestionService(Dio read);

  Future<QuestionModel> getQuestion() async {
    final response = await dio.get('${baseurl}getUserQuestionList');
    if (response.statusCode == 200) {
      return QuestionModel.fromJson(response.data);
    } else {
      throw DioException(requestOptions: response.requestOptions);
    }
  }





}
