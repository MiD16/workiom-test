import 'package:flutter/material.dart';
import '../core/app_export.dart';

class TextStyleHelper {
  static TextStyleHelper? _instance;

  TextStyleHelper._();

  static TextStyleHelper get instance {
    _instance ??= TextStyleHelper._();
    return _instance!;
  }

  TextStyle get title22MediumRubik => TextStyle(
        fontSize: 22.fSize,
        fontWeight: FontWeight.w500,
        fontFamily: 'Rubik',
        color: appTheme.black_900,
      );

  TextStyle get title20RegularRoboto => TextStyle(
        fontSize: 20.fSize,
        fontWeight: FontWeight.w400,
        fontFamily: 'Roboto',
      );

  TextStyle get title17RegularRubik => TextStyle(
        fontSize: 17.fSize,
        fontWeight: FontWeight.w400,
        fontFamily: 'Rubik',
        color: appTheme.gray_700,
      );

  TextStyle get body15RegularRubik => TextStyle(
        fontSize: 15.fSize,
        fontWeight: FontWeight.w400,
        fontFamily: 'Rubik',
        color: appTheme.black_900,
      );

  TextStyle get body15MediumRubik => TextStyle(
        fontSize: 15.fSize,
        fontWeight: FontWeight.w500,
        fontFamily: 'Rubik',
      );

  TextStyle get body13RegularRubik => TextStyle(
        fontSize: 13.fSize,
        fontWeight: FontWeight.w400,
        fontFamily: 'Rubik',
        color: appTheme.gray_700,
      );

  TextStyle get body12RegularRubik => TextStyle(
        fontSize: 12.fSize,
        fontWeight: FontWeight.w400,
        fontFamily: 'Rubik',
        color: appTheme.gray_700,
      );
}
