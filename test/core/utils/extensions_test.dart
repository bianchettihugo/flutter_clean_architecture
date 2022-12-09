import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/utils/extensions.dart';
import 'package:flutter_clean_architecture/core/utils/size.dart';
import 'package:flutter_clean_architecture/core/widgets/application/application.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {
    Application.sizeConfig = SizeService(
      constraints: BoxConstraints.loose(const Size(500, 900)),
      designSize: const Size(450, 840),
    );
  });
  group('size extension', () {
    test(
        'should return a double calculated from screen height in relation to design size height',
        () async {
      Extensions();
      expect(double.parse(25.h.toStringAsFixed(2)), 26.79);
    });

    test(
        'should return a double calculated from screen width in relation to design size width',
        () async {
      expect(double.parse(12.w.toStringAsFixed(2)), 13.33);
    });

    test(
        'should return a double used on font size calculated from screen width in relation to design size width',
        () async {
      expect(double.parse(22.fs.toStringAsFixed(2)), 24.44);
    });

    test('should return the original value in case sizeConfig is null',
        () async {
      Application.sizeConfig = null;
      expect(25.h, 25);
      expect(12.w, 12);
      expect(22.fs, 22);
    });
  });
}
