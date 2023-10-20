import '../exports.dart';

final questionListProvider = FutureProvider<QuestionModel>((ref) async {
  final apiService = QuestionService(ref.read(dioProvider));
  return apiService.getQuestion();
});
