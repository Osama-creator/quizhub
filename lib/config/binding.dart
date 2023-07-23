// ignore_for_file: unused_local_variable

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:queen/facades/app.dart';
import 'package:quizhub/app/controllers/auth_controller.dart';
import 'package:quizhub/app/services/admin.dart';
import 'package:quizhub/app/services/auth.dart';
import 'package:quizhub/app/services/common.dart';
import 'package:quizhub/app/services/exams.dart';
import 'package:quizhub/app/services/money_financials.dart';
import 'package:quizhub/app/services/parent.dart';
import 'package:quizhub/app/services/post_comment.dart';
import 'package:quizhub/app/services/student_exercises.dart';
import 'package:quizhub/app/services/teacher.dart';
import 'package:quizhub/config/endpoints.dart';
import 'package:quizhub/config/lang.dart';
import 'package:quizhub/config/theme.dart';
import 'package:quizhub/helper/client.dart';
import 'package:quizhub/helper/func.dart';

class AppBindings extends Bindings {
  @override
  Future<void> dependencies() async {
    WidgetsFlutterBinding.ensureInitialized();

    await App.boot(
      nationsConfig: AppLangConfig(),
      themeConfig: AppThemeConfig(),
    );
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.primary,
        statusBarColor: AppColors.primary,
      ),
    );

    final dio = Dio(
      BaseOptions(
        baseUrl: Endpoints.api,
        headers: {
          'accept': 'application/json',
        },
        connectTimeout: 5000,
        receiveTimeout: 3000,
        validateStatus: (_) => true,
        listFormat: ListFormat.multiCompatible,
      ),
    );
    final client = ApiClient(dio);
    Get.put<ApiClient>(client);
    Get.put<AuthService>(AuthService(client));
    Get.put<ExamsService>(ExamsService(client));
    Get.put<CommonService>(CommonService(client));
    Get.put<StudentExamsService>(StudentExamsService(client));
    Get.put<PostCommentervice>(PostCommentervice(client));
    Get.put<ParentService>(ParentService(client));
    Get.put<TeacherService>(TeacherService(client));
    Get.put<AdminService>(AdminService(client));
    Get.put<FinancialsService>(FinancialsService(client));
    Get.put(AuthController(), permanent: true);
    Get.put(ActionHandel(), permanent: true);
  }
}
