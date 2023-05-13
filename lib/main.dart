import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:queen/queen.dart';
import 'package:quizhub/app/routes/app_pages.dart';
import 'package:quizhub/config/binding.dart';

void main() async {
  await AppBindings().dependencies();
  runApp(
    QueenBuilder(
      builder: (context) {
        if (Get.locale != Lang.current) {
          Get.updateLocale(Lang.current);
        }
        return GetMaterialApp(
          title: "QuizHub",
          theme: AppTheme.current,
          locale: Lang.current,
          supportedLocales: Lang.supportedLocales,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          debugShowCheckedModeBanner: false,
          // builder: (context, child) {
          //   return QDebugBar(
          //     enabled: false,
          //     child: DevicePreview.appBuilder(context, child),
          //   );
          // },
        );
      },
    ),
  );
}
