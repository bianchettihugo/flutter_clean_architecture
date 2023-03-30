import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/constants/files.dart';

class WeatherLoading extends StatelessWidget {
  const WeatherLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        fit: StackFit.loose,
        children: [
          Image.asset(Files.weatherCloud, width: 164),
          Transform.translate(
            offset: const Offset(-10, -10),
            child: const Align(
              alignment: Alignment.bottomRight,
              child: CircularProgressIndicator(
                color: Color(0xff373737),
              ),
            ),
          )
        ],
      ),
    );
  }
}
