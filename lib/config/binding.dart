import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:queen/queen.dart';
import 'package:quizhub/config/lang.dart';
import 'package:quizhub/config/theme.dart';

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
  }
}
