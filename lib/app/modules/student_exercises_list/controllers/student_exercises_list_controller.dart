import 'package:get/get.dart';

class StudentExercisesListController extends GetxController {
  List<String> teachers = [
    'خالد مختار',
    'أحمد حمدي',
    'على سمعون',
    'محمد شعبان',
    'أحمد عبده',
  ];
  String selectedTeacher = 'خالد مختار';
  Map<String, List<String>> subjectExams = {
    'خالد مختار': ['Exam 1-1', 'Exam 1-2', 'Exam 1-3'],
    'أحمد حمدي': ['Exam 2-1', 'Exam 2-2'],
    'على سمعون': ['Exam 3-1', 'Exam 3-2', 'Exam 3-3', 'Exam 3-4'],
    'محمد شعبان': ['Exam 4-1'],
    'أحمد عبده': ['Exam 5-1', 'Exam 5-2', 'Exam 5-3'],
  };

  void onSelect(int index) {
    final teacher = teachers[index];
    selectedTeacher = teacher;
    update();
  }
}
