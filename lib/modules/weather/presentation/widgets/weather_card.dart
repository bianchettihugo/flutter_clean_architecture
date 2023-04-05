import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/styles/typography.dart';

class WeatherCard extends StatelessWidget {
  final String iconPath;
  final String content;
  final String title;

  const WeatherCard({
    required this.iconPath,
    required this.title,
    required this.content,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).primaryColor.withOpacity(0.5),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(iconPath, width: 32),
          const SizedBox(width: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              StyledText.displaySmall(title),
              StyledText.bodyMedium(content),
            ],
          ),
        ],
      ),
    );
  }
}
