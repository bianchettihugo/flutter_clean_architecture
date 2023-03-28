import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/styles/typography.dart';

enum LinkButtonSize { big, small }

class LinkButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final void Function() onTap;
  final double opacity;
  final LinkButtonSize size;
  final Color? color;

  const LinkButton(
      {Key? key,
      required this.text,
      required this.onTap,
      this.icon,
      this.opacity = 1,
      this.size = LinkButtonSize.big,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fontType = size == LinkButtonSize.big
        ? StyledText.bodyLarge
        : StyledText.bodyMedium;
    return TextButton.icon(
      onPressed: onTap,
      icon: icon != null
          ? Transform.translate(
              offset: const Offset(3, 0),
              child: Icon(icon,
                  size: 22, color: color ?? Theme.of(context).primaryColor),
            )
          : const SizedBox.shrink(),
      label: fontType(
        text,
        style: TextStyle(
            color: Theme.of(context).primaryColor.withOpacity(opacity),
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
