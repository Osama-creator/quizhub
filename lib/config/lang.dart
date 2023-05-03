import 'package:flutter/material.dart';
import 'package:queen/config/lang.dart';

class AppLangConfig extends LangConfig {
  @override
  List<Locale> get supportedLocales => const [
        Locale('ar'),
        Locale('en'),
      ];
}
