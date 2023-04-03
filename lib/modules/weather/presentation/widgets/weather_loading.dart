import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/constants/files.dart';

class WeatherLoading extends StatelessWidget {
  const WeatherLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 100,
        height: 100,
        child: Stack(
          fit: StackFit.loose,
          children: [
            Image.asset(Files.weatherCloud, width: 164),
            Transform.translate(
              offset: const Offset(-12, -30),
              child: const Align(
                alignment: Alignment.bottomRight,
                child: SizedBox(
                  width: 32,
                  height: 32,
                  child: CircularProgressIndicator(
                    color: Color(0xff373737),
                    strokeWidth: 5,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
