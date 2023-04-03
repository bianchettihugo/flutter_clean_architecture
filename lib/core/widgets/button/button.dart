import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/styles/typography.dart';

class Button extends StatelessWidget {
  final String text;
  final IconData? icon;
  final void Function() onTap;
  final VisualDensity _density;
  final Color? color;

  const Button({
    required this.text,
    required this.onTap,
    this.icon,
    this.color,
    Key? key,
  })  : _density = VisualDensity.comfortable,
        super(key: key);

  const Button.small({
    required this.text,
    required this.onTap,
    this.icon,
    this.color,
    Key? key,
  })  : _density = VisualDensity.compact,
        super(key: key);

  const Button.big({
    required this.text,
    required this.onTap,
    this.icon,
    this.color,
    Key? key,
  })  : _density = VisualDensity.standard,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onTap,
      style: ButtonStyle(
          visualDensity: _density,
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9),
          )),
          backgroundColor: MaterialStateProperty.all<Color>(
              color ?? Theme.of(context).primaryColor),
          minimumSize:
              MaterialStateProperty.all<Size>(const Size(double.infinity, 56))),
      icon: icon != null
          ? Transform.translate(
              offset: const Offset(-5, -0.7),
              child: Icon(icon, size: 24),
            )
          : const SizedBox.shrink(),
      label: _density == VisualDensity.compact
          ? StyledText.titleSmall(
              text,
              style: const TextStyle(color: Colors.white),
            )
          : StyledText.titleMedium(
              text,
              style: const TextStyle(color: Colors.white),
            ),
    );
  }
}
