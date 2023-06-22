import 'package:get/get.dart';

class McqExerciseController extends GetxController {
  // late PageController pageController;
  // bool? isTrue;

  // int qNumber = 1;
  // List<McqQuestion> quistionList = Myq().myquestions;

  // int qIndex() {
  //   final int n =
  //       pageController.hasClients ? pageController.page?.toInt() ?? 0 : 0;
  //   update();
  //   return n;
  // }

  // void selectChoice(String value) {
  //   final currentQuestion = quistionList[pageController.page!.toInt()];
  //   currentQuestion.userChoice = value;

  //   update();
  // }

  // void checkAnswer() {
  //   final currentQuestion = quistionList[pageController.page!.toInt()];
  //   if (currentQuestion.userChoice == currentQuestion.rightAnswer) {
  //     isTrue = true;
  //   } else {
  //     isTrue = false;
  //   }
  //   update();

  //   showAnswerSheet(isTrue!, currentQuestion.rightAnswer);
  //   Future.delayed(const Duration(seconds: 3), () {
  //     if (qNumber < quistionList.length) {
  //       pageController.nextPage(
  //         duration: const Duration(milliseconds: 500),
  //         curve: Curves.ease,
  //       );
  //       qNumber++;
  //       Get.back();
  //       update();
  //     } else {
  //       Get.toNamed(Routes.TRUE_FALSE_EXERCISE);
  //     }
  //   });
  // }

  // // ignore: avoid_positional_boolean_parameters
  // void showAnswerSheet(bool isCorrect, String correctAnswer) {
  //   Get.bottomSheet(
  //     Container(
  //       color: isCorrect ? Colors.green : Colors.red,
  //       padding: const EdgeInsets.all(16.0),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.stretch,
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           Text(
  //             isCorrect ? 'إجابه صحيحه' : 'إجابه خاطئه',
  //             style: const TextStyle(
  //               color: Colors.white,
  //               fontSize: 18.0,
  //               fontWeight: FontWeight.bold,
  //             ),
  //             textAlign: TextAlign.center,
  //           ),
  //           const SizedBox(height: 10.0),
  //           if (!isCorrect)
  //             Text(
  //               'الإجابه الصحيحه هي: $correctAnswer',
  //               style: const TextStyle(
  //                 color: Colors.white,
  //                 fontSize: 16.0,
  //               ),
  //               textAlign: TextAlign.center,
  //             ),
  //         ],
  //       ),
  //     ),
  //     barrierColor: Colors.black54,
  //     elevation: 5.0,
  //     shape: const RoundedRectangleBorder(
  //       borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
  //     ),
  //     isDismissible: false,
  //   );
  // }

  // @override
  // Future<void> onInit() async {
  //   pageController = PageController();
  //   super.onInit();
  // }
}
