import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/utils/extensions.dart';

class AppTypography {
  const AppTypography();

  static TextStyle get block => TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 20.fs,
      );

  static TextStyle get body1 => TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 18.fs,
      );

  static TextStyle get body2 => TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 14.fs,
      );

  static TextStyle get captalized => TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 14.fs,
        letterSpacing: 2.fs,
      );

  static TextStyle get heading1 => TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 40.fs,
      );

  static TextStyle get heading2 => TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 32.fs,
      );

  static TextStyle get heading3 => TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 28.fs,
      );

  static TextStyle get heading4 => TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 24.fs,
      );

  static TextStyle get heading5 => TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 20.fs,
      );

  static TextStyle get heading6 => TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 16.fs,
      );

  static TextStyle get lead => TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 14.fs,
      );

  static TextStyle get small => TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 12.fs,
      );

  static TextStyle get tiny => TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 10.fs,
      );
}
