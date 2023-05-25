import 'package:get/get.dart';

import '../modules/grade_exercises/bindings/grade_exercises_binding.dart';
import '../modules/grade_exercises/views/grade_exercises_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/sign_in/bindings/sign_in_binding.dart';
import '../modules/sign_in/views/sign_in_view.dart';
import '../modules/sign_up/bindings/sign_up_binding.dart';
import '../modules/sign_up/views/sign_up_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/teacher_home/bindings/teacher_home_binding.dart';
import '../modules/teacher_home/views/teacher_home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.TEACHER_HOME;

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
  ];
}
