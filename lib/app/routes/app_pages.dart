import 'package:get/get.dart';

import 'package:quizhub/app/modules/admin_add_folowers_orders/bindings/admin_add_folowers_orders_binding.dart';
import 'package:quizhub/app/modules/admin_add_folowers_orders/views/admin_add_folowers_orders_view.dart';
import 'package:quizhub/app/modules/admin_home/bindings/admin_home_binding.dart';
import 'package:quizhub/app/modules/admin_home/views/admin_home_view.dart';
import 'package:quizhub/app/modules/admin_schools_list/bindings/admin_schools_list_binding.dart';
import 'package:quizhub/app/modules/admin_schools_list/views/admin_schools_list_view.dart';
import 'package:quizhub/app/modules/admin_teacher_summery/bindings/admin_teacher_summery_binding.dart';
import 'package:quizhub/app/modules/admin_teacher_summery/views/admin_teacher_summery_view.dart';
import 'package:quizhub/app/modules/admin_teachers_of_school/bindings/admin_teachers_of_school_binding.dart';
import 'package:quizhub/app/modules/admin_teachers_of_school/views/admin_teachers_of_school_view.dart';
import 'package:quizhub/app/modules/comments_page/bindings/comments_page_binding.dart';
import 'package:quizhub/app/modules/comments_page/views/comments_page_view.dart';
import 'package:quizhub/app/modules/complate_exercise/bindings/complate_exercise_binding.dart';
import 'package:quizhub/app/modules/complate_exercise/views/complate_exercise_view.dart';
import 'package:quizhub/app/modules/create_choose_exercise/bindings/create_choose_exercise_binding.dart';
import 'package:quizhub/app/modules/create_choose_exercise/views/create_choose_exercise_view.dart';
import 'package:quizhub/app/modules/create_fill_gabs_exercise/bindings/create_fill_gabs_exercise_binding.dart';
import 'package:quizhub/app/modules/create_fill_gabs_exercise/views/create_fill_gabs_exercise_view.dart';
import 'package:quizhub/app/modules/create_matching_exercise/bindings/create_matching_exercise_binding.dart';
import 'package:quizhub/app/modules/create_matching_exercise/views/create_matching_exercise_view.dart';
import 'package:quizhub/app/modules/create_true_false_exercise/bindings/create_true_false_exercise_binding.dart';
import 'package:quizhub/app/modules/create_true_false_exercise/views/create_true_false_exercise_view.dart';
import 'package:quizhub/app/modules/edit_exercise/bindings/edit_exercise_binding.dart';
import 'package:quizhub/app/modules/edit_exercise/views/edit_exercise_view.dart';
import 'package:quizhub/app/modules/envitations_list/bindings/envitations_list_binding.dart';
import 'package:quizhub/app/modules/envitations_list/views/envitations_list_view.dart';
import 'package:quizhub/app/modules/financial_dues/bindings/financial_dues_binding.dart';
import 'package:quizhub/app/modules/financial_dues/views/financial_dues_view.dart';
import 'package:quizhub/app/modules/folwed_teachers/bindings/folwed_teachers_binding.dart';
import 'package:quizhub/app/modules/folwed_teachers/views/folwed_teachers_view.dart';
import 'package:quizhub/app/modules/grade_exercises/bindings/grade_exercises_binding.dart';
import 'package:quizhub/app/modules/grade_exercises/views/grade_exercises_view.dart';
import 'package:quizhub/app/modules/home/bindings/home_binding.dart';
import 'package:quizhub/app/modules/home/views/home_view.dart';
import 'package:quizhub/app/modules/matching_exercise/bindings/matching_exercise_binding.dart';
import 'package:quizhub/app/modules/matching_exercise/views/matching_exercise_view.dart';
import 'package:quizhub/app/modules/mcq_exercise/bindings/mcq_exercise_binding.dart';
import 'package:quizhub/app/modules/mcq_exercise/views/mcq_exercise_view.dart';
import 'package:quizhub/app/modules/parent_home/bindings/parent_home_binding.dart';
import 'package:quizhub/app/modules/parent_home/views/parent_home_view.dart';
import 'package:quizhub/app/modules/questions_posts/bindings/questions_posts_binding.dart';
import 'package:quizhub/app/modules/questions_posts/views/questions_posts_view.dart';
import 'package:quizhub/app/modules/search_for_students/bindings/search_for_students_binding.dart';
import 'package:quizhub/app/modules/search_for_students/views/search_for_students_view.dart';
import 'package:quizhub/app/modules/search_for_teachers/bindings/search_for_teachers_binding.dart';
import 'package:quizhub/app/modules/search_for_teachers/views/search_for_teachers_view.dart';
import 'package:quizhub/app/modules/sign_in/bindings/sign_in_binding.dart';
import 'package:quizhub/app/modules/sign_in/views/sign_in_view.dart';
import 'package:quizhub/app/modules/sign_up/bindings/sign_up_binding.dart';
import 'package:quizhub/app/modules/sign_up/views/sign_up_view.dart';
import 'package:quizhub/app/modules/splash/bindings/splash_binding.dart';
import 'package:quizhub/app/modules/splash/views/splash_view.dart';
import 'package:quizhub/app/modules/student_exercises_list/bindings/student_exercises_list_binding.dart';
import 'package:quizhub/app/modules/student_exercises_list/views/student_exercises_list_view.dart';
import 'package:quizhub/app/modules/student_home/bindings/student_home_binding.dart';
import 'package:quizhub/app/modules/student_home/views/student_home_view.dart';
import 'package:quizhub/app/modules/student_overview/bindings/student_overview_binding.dart';
import 'package:quizhub/app/modules/student_overview/views/student_overview_view.dart';
import 'package:quizhub/app/modules/students_envit/bindings/students_envit_binding.dart';
import 'package:quizhub/app/modules/students_envit/views/students_envit_view.dart';
import 'package:quizhub/app/modules/students_grades/bindings/students_grades_binding.dart';
import 'package:quizhub/app/modules/students_grades/views/students_grades_view.dart';
import 'package:quizhub/app/modules/teacher_home/bindings/teacher_home_binding.dart';
import 'package:quizhub/app/modules/teacher_home/views/teacher_home_view.dart';
import 'package:quizhub/app/modules/teacher_summery/bindings/teacher_summery_binding.dart';
import 'package:quizhub/app/modules/teacher_summery/views/teacher_summery_view.dart';
import 'package:quizhub/app/modules/techer_page/bindings/techer_page_binding.dart';
import 'package:quizhub/app/modules/techer_page/views/techer_page_view.dart';
import 'package:quizhub/app/modules/true_false_exercise/bindings/true_false_exercise_binding.dart';
import 'package:quizhub/app/modules/true_false_exercise/views/true_false_exercise_view.dart';

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
    GetPage(
      name: _Paths.MCQ_EXERCISE,
      page: () => const McqExerciseView(),
      binding: McqExerciseBinding(),
    ),
    GetPage(
      name: _Paths.COMMENTS_PAGE,
      page: () => const CommentsPageView(),
      binding: CommentsPageBinding(),
    ),
    GetPage(
      name: _Paths.QUESTIONS_POSTS,
      page: () => const QuestionsPostsView(),
      binding: QuestionsPostsBinding(),
    ),
    GetPage(
      name: _Paths.ENVITATIONS_LIST,
      page: () => const EnvitationsListView(),
      binding: EnvitationsListBinding(),
    ),
    GetPage(
      name: _Paths.STUDENTS_ENVIT,
      page: () => StudentsEnvitView(),
      binding: StudentsEnvitBinding(),
    ),
    GetPage(
      name: _Paths.TRUE_FALSE_EXERCISE,
      page: () => const TrueFalseExerciseView(),
      binding: TrueFalseExerciseBinding(),
    ),
    GetPage(
      name: _Paths.MATCHING_EXERCISE,
      page: () => const MatchingExerciseView(),
      binding: MatchingExerciseBinding(),
    ),
    GetPage(
      name: _Paths.TECHER_PAGE,
      page: () => const TecherPageView(),
      binding: TecherPageBinding(),
    ),
    GetPage(
      name: _Paths.COMPLATE_EXERCISE,
      page: () => const ComplateExerciseView(),
      binding: ComplateExerciseBinding(),
    ),
    GetPage(
      name: _Paths.STUDENTS_GRADES,
      page: () => const StudentsGradesView(),
      binding: StudentsGradesBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_TEACHERS_OF_SCHOOL,
      page: () => const AdminTeachersOfSchoolView(),
      binding: AdminTeachersOfSchoolBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_TEACHER_SUMMERY,
      page: () => const AdminTeacherSummeryView(),
      binding: AdminTeacherSummeryBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_TRUE_FALSE_EXERCISE,
      page: () => const CreateTrueFalseExerciseView(),
      binding: CreateTrueFalseExerciseBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_FOR_STUDENTS,
      page: () => SearchForStudentsView(),
      binding: SearchForStudentsBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_FOR_TEACHERS,
      page: () => SearchForTeachersView(),
      binding: SearchForTeachersBinding(),
    ),
    GetPage(
      name: _Paths.TEACHER_SUMMERY,
      page: () => const TeacherSummeryView(),
      binding: TeacherSummeryBinding(),
    ),
    GetPage(
      name: _Paths.FOLWED_TEACHERS,
      page: () => const FolwedTeachersView(),
      binding: FolwedTeachersBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_ADD_FOLOWERS_ORDERS,
      page: () => const AdminAddFolowersOrdersView(),
      binding: AdminAddFolowersOrdersBinding(),
    ),
  ];
}
