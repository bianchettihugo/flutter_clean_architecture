import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/theme/light_theme.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'modules/user/presentation/pages/intro_page.dart';

void main() {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListGym',
      debugShowCheckedModeBanner: false,
      theme: LightTheme.theme,
      home: const IntroPage(),
    );
  }
}
