import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  double opacity = 1;
  double height = 0;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom],
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FlutterNativeSplash.remove();
      Future.delayed(const Duration(milliseconds: 1000), () async {
        setState(() {
          opacity = 0;
        });
        await Future.delayed(const Duration(milliseconds: 500));
        setState(() {
          height = MediaQuery.of(context).size.height;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: [
          Center(
            child: AnimatedOpacity(
              opacity: opacity,
              duration: const Duration(milliseconds: 700),
              curve: Curves.ease,
              child: const Image(
                image: ExactAssetImage('assets/splash.png'),
                isAntiAlias: true,
                //filterQuality: FilterQuality.high,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 450),
              curve: Curves.ease,
              color: Theme.of(context).backgroundColor,
              width: double.maxFinite,
              height: height,
            ),
          ),
        ],
      ),
    );
  }
}
