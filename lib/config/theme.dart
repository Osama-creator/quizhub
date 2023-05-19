import 'package:flutter/material.dart';
import 'package:queen/queen.dart';

class AppThemeConfig extends ThemeConfig {
  @override
  List<QTheme> get themes => [
        QTheme(
          id: 'light',
          theme: themeLight(),
          name: 'light'.tr,
        )
      ];
}

class ColorLight {
  static const Color primary = Color(0xff624D90);
  // static const Color primary = Color(0xFF5d5ff0);
  static const Color background = Colors.white;
  // static const Color background = Color(0xFFf5f4f7);
  static const Color card = Color(0xFFFFFFFF);
  static const Color fontTitle = Color(0xff624D90);
  static const Color fontSubtitle = Color(0xFF737373);
  static const Color fontDisable = Color(0xFF9B9B9B);
  static const Color disabledButton = Color(0xFFB9B9B9);
  static const Color divider = Color(0xFFDCDCDC);
  static const Color success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFF57C00);
  static const Color error = Color(0xFFD32F2F);
  static const Color info = Color(0xFF1976D2);
}

ThemeData themeLight() {
  return ThemeData(
    fontFamily: 'Stv',
    primaryColor: ColorLight.primary,
    colorScheme: const ColorScheme.light().copyWith(
      secondary: ColorLight.background,
    ),
    primaryIconTheme: const IconThemeData(
      color: ColorLight.fontTitle,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: ColorLight.primary,
    ),
    scaffoldBackgroundColor: const Color(0xFFeeeeee),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: ColorLight.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        backgroundColor: const MaterialStatePropertyAll(AppColors.primary),
      ),
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(
        color: ColorLight.fontTitle,
        fontWeight: FontWeight.w500,
      ),
      headline2: TextStyle(
        color: ColorLight.fontTitle,
        fontWeight: FontWeight.w500,
      ),
      headline3: TextStyle(
        color: ColorLight.fontTitle,
        fontWeight: FontWeight.w500,
      ),
      headline4: TextStyle(
        color: ColorLight.fontTitle,
        fontWeight: FontWeight.w500,
      ),
      headline5: TextStyle(
        color: ColorLight.fontTitle,
        fontWeight: FontWeight.w500,
      ),
      headline6: TextStyle(
        color: ColorLight.fontTitle,
      ),
      bodyText1: TextStyle(
        color: ColorLight.fontTitle,
        fontWeight: FontWeight.normal,
      ),
      bodyText2: TextStyle(
        color: ColorLight.fontTitle,
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
      subtitle1: TextStyle(
        color: ColorLight.fontSubtitle,
        fontWeight: FontWeight.normal,
      ),
      subtitle2: TextStyle(
        color: ColorLight.fontSubtitle,
        fontWeight: FontWeight.normal,
      ),
      button: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.normal,
      ),
      caption: TextStyle(
        color: Colors.grey,
        fontWeight: FontWeight.normal,
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: ColorLight.background,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ColorLight.primary,
    ),
  );
}

abstract class AppColors {
  static const primary = Color(0xff624D90);
  static const nextPrimary = Color(0xffF2BF33);
  static const light = Color.fromARGB(255, 255, 255, 255);
  static const darkBlue = Color(0xFF242249);
  static const orangeColor = Color(0xffC4822D);
  static const drawerColor = Color(0xFF2C2E3E);
  static const red = Color(0xffE02E4D);
  static const green = Color(0xffFFB822);
  // elzero
  static const zeroBlue = Color(0xff2094fc);
}
