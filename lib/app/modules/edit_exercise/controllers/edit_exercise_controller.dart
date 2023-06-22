import 'package:get/get.dart';
import 'package:quizhub/app/models/questions.dart';
import 'package:quizhub/app/services/exams.dart';
import 'package:quizhub/helper/func.dart';

class EditExerciseController extends GetxController {
  final examsService = Get.find<ExamsService>();
  final String examId = Get.arguments as String;
  late List<McqQuestion> apiQuestions = [];

  @override
  Future<void> onInit() async {
    try {
      apiQuestions = await examsService.getExercise(id: examId);
      update();
    } catch (e, st) {
      catchLog("err$e", st);
    }
    super.onInit();
  }

  Future<void> updateQuestion({
    required McqQuestion mcqQuestion,
    required String id,
  }) async {
    try {
      final body = {
        "IdQuestion": id,
        "question": mcqQuestion.question,
        "correct_Answer": mcqQuestion.rightAnswer,
      };

      await examsService.updateQuestion(body: body);

      // Handle success

    } catch (e, st) {
      // Handle error
      throw Exception('Error: $e, $st');
    }
  }
}
