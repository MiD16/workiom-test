import 'package:flutter/material.dart';

LightCodeColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();

class ThemeHelper {
  final _appTheme = "lightCode";

  final Map<String, LightCodeColors> _supportedCustomColor = {
    'lightCode': LightCodeColors()
  };

  final Map<String, ColorScheme> _supportedColorScheme = {
    'lightCode': ColorSchemes.lightCodeColorScheme
  };

  LightCodeColors _getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? LightCodeColors();
  }

  ThemeData _getThemeData() {
    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.lightCodeColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
    );
  }

  LightCodeColors themeColor() => _getThemeColors();

  ThemeData themeData() => _getThemeData();
}

class ColorSchemes {
  static final lightCodeColorScheme = ColorScheme.light();
}

class LightCodeColors {
  Color get blueA200 => Color(0xFF4E86F7);
  Color get black_900 => Color(0xFF0E0F12);
  Color get gray_700 => Color(0xFF555555);
  Color get orange_100 => Color(0xFFFFDFBA);
  Color get deepOrange_200 => Color(0xFFEEBA96);
  Color get blue_400 => Color(0xFF42ADE2);
  Color get amber_500 => Color(0xFFFFC107);
  Color get deepOrangeA400 => Color(0xFFFF3D00);
  Color get green_500 => Color(0xFF4CAF50);
  Color get blue_700 => Color(0xFF1976D2);
  Color get gray_100 => Color(0xFFF4F4F4);
  Color get whiteA700 => Color(0xFFFFFFFF);
  Color get blueA200_01 => Color(0xFF3A86FF);
  Color get amber_500_01 => Color(0xFFFDBC0B);
  Color get deepPurpleA200 => Color(0xFF9635F0);
  Color get pinkA400 => Color(0xFFFF006E);
  Color get gray_900 => Color(0xFF020547);
  Color get black_900_19 => Color(0x19000000);
  Color get blueGray_100 => Color(0xFFD5D5D5);
  Color get gray_600 => Color(0xFF737373);
  Color get green_400 => Color(0xFF5BD77E);
  Color get blueGray_900 => Color(0xFF373737);

  Color get whiteCustom => Colors.white;
  Color get transparentCustom => Colors.transparent;
  Color get redCustom => Colors.red;
  Color get greyCustom => Colors.grey;
  Color get colorB25555 => Color(0xB2555555);
  Color get colorFFE5E5 => Color(0xFFE5E5E5);

  Color get grey200 => Colors.grey.shade200;
  Color get grey100 => Colors.grey.shade100;
}
