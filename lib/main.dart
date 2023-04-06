import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clean_architecture/core/styles/text_theme.dart';
import 'package:flutter_clean_architecture/core/utils/application.dart';
import 'package:flutter_clean_architecture/modules/location/location.dart';
import 'package:flutter_clean_architecture/modules/modules.dart';
import 'package:flutter_clean_architecture/modules/weather/presentation/pages/weather_page.dart';
import 'package:flutter_clean_architecture/modules/weather/weather.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  BaseModule.init();
  LocationModule.init();
  WeatherModule.init();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('pt', 'BR'),
        Locale('pt'),
        Locale('en'),
      ],
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xff6D67D0),
        textTheme: customTextTheme.apply(
          bodyColor: const Color(0xffE7E6FB),
          displayColor: const Color(0xffE7E6FB),
        ),
      ),
      home: Builder(builder: (context) {
        Application.localization = AppLocalizations.of(context);
        return const WeatherPage();
      }),
    );
  }
}
