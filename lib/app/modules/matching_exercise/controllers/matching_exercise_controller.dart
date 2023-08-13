import 'package:get/get.dart';
import 'package:quizhub/app/models/exercises.dart';
import 'package:quizhub/app/models/questions.dart';
import 'package:quizhub/app/modules/home/controllers/home_controller.dart';
import 'package:quizhub/app/modules/student_home/controllers/student_home_controller.dart';
import 'package:quizhub/app/services/exams.dart';
import 'package:quizhub/app/services/student_exercises.dart';
import 'package:quizhub/helper/func.dart';

class MatchingExerciseController extends GetxController {
  final String examId = Get.arguments as String;
  late List<McqQuestion> questions = [];
  late Exam exam = Exam(
    id: "id",
    examName: "examName",
    questions: [],
  );

  final examsService = Get.find<ExamsService>();
  int degree = 0;
  final studentExamsService = Get.find<StudentExamsService>();

  @override
  Future<void> onInit() async {
    try {
      exam = await examsService.getExercise(id: examId);
      questions = exam.questions;
      questions.shuffle();
    } catch (e, st) {
      catchLog("err$e", st);
    }
    update();
    super.onInit();
  }

  void selectFWord(String questionId, String fWord) {
    final question = questions.firstWhere((q) => q.id == questionId);

    if (!question.isSelectedFWord! && !hasSelectedFWord()) {
      question.isSelectedFWord = true;
      question.isCorrect = question.rightAnswer == fWord;
      update();

      if (!question.isCorrect!) {
        // Reset the selected second word if the first word is incorrect
        question.isSelectedSWord = false;
      }
    }
  }

  bool hasSelectedFWord() {
    return questions.any((q) => q.isSelectedFWord!);
  }

  void selectSWord(String questionId, String sWord) {
    final question = questions.firstWhere((q) => q.id == questionId);
    if (!question.isSelectedSWord! && question.isSelectedFWord!) {
      question.isSelectedSWord = true;
      question.isCorrect = question.question == sWord;
      questions.removeWhere((q) => q.id == questionId);
      if (questions.isEmpty) {
        finishExam();
      }
      update();
    }
  }

  void finishExam() {
    studentExamsService.postDegree(
      idUser: "6499a3f690230b8ecf61875a",
      degree: degree,
      idexam: examId,
    );
    Get.find<StudentHomeController>().fetchSubjects();
    Get.find<HomeController>().refreshData();
    Get.back();
  }

//   bool isAllAnswered() {
//     for (final question in questions) {
//       if (!question.isSelectedFWord! || !question.isSelectedSWord!) {
//         return false;
//       }
//     }
//     finishExam();
//     return true;
//   }
}
