import 'package:flutter_clean_architecture/core/widgets/application/application.dart';

class Extensions {}

extension SizeExtension on num {
  double get w => Application.sizeConfig?.setWidth(this) ?? this * 1;

  double get h => Application.sizeConfig?.setHeight(this) ?? this * 1;

  double get fs => Application.sizeConfig?.setFontSize(this) ?? this * 1;
}
