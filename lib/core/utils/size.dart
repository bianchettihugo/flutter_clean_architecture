import 'package:flutter/material.dart';

class SizeService {
  final BoxConstraints constraints;
  final Size designSize;

  late double _screenWidth;
  late double _screenHeight;

  SizeService({
    required this.constraints,
    required this.designSize,
  }) {
    _screenWidth = constraints.maxWidth;
    _screenHeight = constraints.maxHeight;
  }

  double setWidth(num width) => width * (_screenWidth / designSize.width);

  double setHeight(num height) => height * (_screenHeight / designSize.height);

  double setFontSize(num fontSize) =>
      fontSize * (_screenWidth / designSize.width);
}
