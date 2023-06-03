import 'package:get/get.dart';
import 'package:quizhub/app/models/questions.dart';

class MatchingExerciseController extends GetxController {
  late List<MatchingQuestion> questions;

  @override
  void onInit() {
    questions = [
      MatchingQuestion(
        id: '1',
        fWord: 'Apple',
        sWord: 'Red',
      ),
      MatchingQuestion(
        id: '2',
        fWord: 'Banana',
        sWord: 'Yellow',
      ),
      MatchingQuestion(
        id: '3',
        fWord: 'Grapes',
        sWord: 'Purple',
      ),
    ];

    super.onInit();
  }

  void selectFWord(String questionId, String fWord) {
    final question = questions.firstWhere((q) => q.id == questionId);
    if (!question.isSelectedFWord) {
      question.isSelectedFWord = true;
      question.isCorrect = question.sWord == fWord;
      update();
    }
  }

  void selectSWord(String questionId, String sWord) {
    final question = questions.firstWhere((q) => q.id == questionId);
    if (!question.isSelectedSWord) {
      question.isSelectedSWord = true;
      question.isCorrect = question.fWord == sWord;
      update();
    }
  }

  bool isAllAnswered() {
    for (final question in questions) {
      if (!question.isSelectedFWord || !question.isSelectedSWord) {
        return false;
      }
    }
    return true;
  }
}
