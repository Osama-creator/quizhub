import 'package:get/get.dart';

import '../modules/admin_home/bindings/admin_home_binding.dart';
import '../modules/admin_home/views/admin_home_view.dart';
import '../modules/admin_schools_list/bindings/admin_schools_list_binding.dart';
import '../modules/admin_schools_list/views/admin_schools_list_view.dart';
import '../modules/create_choose_exercise/bindings/create_choose_exercise_binding.dart';
import '../modules/create_choose_exercise/views/create_choose_exercise_view.dart';
import '../modules/create_fill_gabs_exercise/bindings/create_fill_gabs_exercise_binding.dart';
import '../modules/create_fill_gabs_exercise/views/create_fill_gabs_exercise_view.dart';
import '../modules/create_matching_exercise/bindings/create_matching_exercise_binding.dart';
import '../modules/create_matching_exercise/views/create_matching_exercise_view.dart';
import '../modules/edit_exercise/bindings/edit_exercise_binding.dart';
import '../modules/edit_exercise/views/edit_exercise_view.dart';
import '../modules/financial_dues/bindings/financial_dues_binding.dart';
import '../modules/financial_dues/views/financial_dues_view.dart';
import '../modules/grade_exercises/bindings/grade_exercises_binding.dart';
import '../modules/grade_exercises/views/grade_exercises_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/parent_home/bindings/parent_home_binding.dart';
import '../modules/parent_home/views/parent_home_view.dart';
import '../modules/sign_in/bindings/sign_in_binding.dart';
import '../modules/sign_in/views/sign_in_view.dart';
import '../modules/sign_up/bindings/sign_up_binding.dart';
import '../modules/sign_up/views/sign_up_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/student_exercises_list/bindings/student_exercises_list_binding.dart';
import '../modules/student_exercises_list/views/student_exercises_list_view.dart';
import '../modules/student_home/bindings/student_home_binding.dart';
import '../modules/student_home/views/student_home_view.dart';
import '../modules/student_overview/bindings/student_overview_binding.dart';
import '../modules/student_overview/views/student_overview_view.dart';
import '../modules/teacher_home/bindings/teacher_home_binding.dart';
import '../modules/teacher_home/views/teacher_home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.STUDENT_HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_IN,
      page: () => const SignInView(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.TEACHER_HOME,
      page: () => const TeacherHomeView(),
      binding: TeacherHomeBinding(),
    ),
    GetPage(
      name: _Paths.GRADE_EXERCISES,
      page: () => const GradeExercisesView(),
      binding: GradeExercisesBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_CHOOSE_EXERCISE,
      page: () => const CreateChooseExerciseView(),
      binding: CreateChooseExerciseBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_FILL_GABS_EXERCISE,
      page: () => const CreateFillGabsExerciseView(),
      binding: CreateFillGabsExerciseBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_MATCHING_EXERCISE,
      page: () => const CreateMatchingExerciseView(),
      binding: CreateMatchingExerciseBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_EXERCISE,
      page: () => const EditExerciseView(),
      binding: EditExerciseBinding(),
    ),
    GetPage(
      name: _Paths.FINANCIAL_DUES,
      page: () => const FinancialDuesView(),
      binding: FinancialDuesBinding(),
    ),
    GetPage(
      name: _Paths.PARENT_HOME,
      page: () => const ParentHomeView(),
      binding: ParentHomeBinding(),
    ),
    GetPage(
      name: _Paths.STUDENT_OVERVIEW,
      page: () => const StudentOverviewView(),
      binding: StudentOverviewBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_HOME,
      page: () => const AdminHomeView(),
      binding: AdminHomeBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_SCHOOLS_LIST,
      page: () => const AdminSchoolsListView(),
      binding: AdminSchoolsListBinding(),
    ),
    GetPage(
      name: _Paths.STUDENT_HOME,
      page: () => const StudentHomeView(),
      binding: StudentHomeBinding(),
    ),
    GetPage(
      name: _Paths.STUDENT_EXERCISES_LIST,
      page: () => const StudentExercisesListView(),
      binding: StudentExercisesListBinding(),
    ),
  ];
}
