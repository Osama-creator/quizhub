import 'package:get/get.dart';

class StudentHomeController extends GetxController {
  String selectedSubject = 'اللغة العربية';
  List<String> subjects = [
    'اللغة العربية',
    'english',
    'رياضيات',
    'علوم',
    'دراسات',
  ];

  Map<String, List<String>> subjectExams = {
    'اللغة العربية': ['Exam 1-1', 'Exam 1-2', 'Exam 1-3'],
    'english': ['Exam 2-1', 'Exam 2-2'],
    'رياضيات': ['Exam 3-1', 'Exam 3-2', 'Exam 3-3', 'Exam 3-4'],
    'علوم': ['Exam 4-1'],
    'دراسات': ['Exam 5-1', 'Exam 5-2', 'Exam 5-3'],
  };

  void onSelect(int index) {
    final subject = subjects[index];
    selectedSubject = subject;
    update();
  }
}
