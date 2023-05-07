import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:get/get.dart';
import 'package:queen/core/widgets/queen_builder.dart';
import 'package:queen/facades/lang.dart';
import 'package:queen/facades/themes.dart';

import 'package:quizhub/app/routes/app_pages.dart';

void main() {
  runApp(
    QueenBuilder(
      builder: (context) {
        if (Get.locale != Lang.current) {
          Get.updateLocale(Lang.current);
        }
        return GetMaterialApp(
          title: "Application",
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
