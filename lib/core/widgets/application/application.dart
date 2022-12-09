import 'package:flutter/material.dart';

import '../../utils/size.dart';

class Application extends StatelessWidget {
  static SizeService? sizeConfig;
  final Widget child;

  const Application({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: const MediaQueryData(),
      child: LayoutBuilder(
        builder: (context, constraints) {
          Application.sizeConfig = SizeService(
            constraints: constraints,
            designSize: const Size(450, 840),
          );
          return child;
        },
      ),
    );
  }
}
