import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/utils/size.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late SizeService sizeConfig;

  setUp(() {
    sizeConfig = SizeService(
      constraints: BoxConstraints.loose(const Size(500, 900)),
      designSize: const Size(450, 840),
    );
  });

  test(
      'should return a double calculated from screen height in relation to design size height',
      () async {
    expect(double.parse(sizeConfig.setHeight(25).toStringAsFixed(2)), 26.79);
  });

  test(
      'should return a double calculated from screen width in relation to design size width',
      () async {
    expect(double.parse(sizeConfig.setWidth(12).toStringAsFixed(2)), 13.33);
  });

  test(
      'should return a double used on font size calculated from screen width in relation to design size width',
      () async {
    expect(double.parse(sizeConfig.setFontSize(22).toStringAsFixed(2)), 24.44);
  });
}
