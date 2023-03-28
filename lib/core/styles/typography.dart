// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/styles/text_theme.dart';

class StyledText extends Text {
  static final TextTheme _theme = customTextTheme;

  StyledText.displayLarge(text,
      {TextStyle style = const TextStyle(), TextAlign align = TextAlign.start})
      : super(text, style: _theme.displayLarge!.merge(style), textAlign: align);
  StyledText.displayMedium(text,
      {TextStyle style = const TextStyle(), TextAlign align = TextAlign.start})
      : super(text,
            style: _theme.displayMedium!.merge(style), textAlign: align);
  StyledText.displaySmall(text,
      {TextStyle style = const TextStyle(), TextAlign align = TextAlign.start})
      : super(text, style: _theme.displaySmall!.merge(style), textAlign: align);

  StyledText.headlineLarge(text,
      {TextStyle style = const TextStyle(), TextAlign align = TextAlign.start})
      : super(text,
            style: _theme.headlineLarge!.merge(style), textAlign: align);
  StyledText.headlineMedium(text,
      {TextStyle style = const TextStyle(), TextAlign align = TextAlign.start})
      : super(text,
            style: _theme.headlineMedium!.merge(style), textAlign: align);
  StyledText.headlineSmall(text,
      {TextStyle style = const TextStyle(), TextAlign align = TextAlign.start})
      : super(text,
            style: _theme.headlineSmall!.merge(style), textAlign: align);

  StyledText.titleLarge(text,
      {TextStyle style = const TextStyle(), TextAlign align = TextAlign.start})
      : super(text, style: _theme.titleLarge!.merge(style), textAlign: align);
  StyledText.titleMedium(text,
      {TextStyle style = const TextStyle(), TextAlign align = TextAlign.start})
      : super(text, style: _theme.titleMedium!.merge(style), textAlign: align);
  StyledText.titleSmall(text,
      {TextStyle style = const TextStyle(), TextAlign align = TextAlign.start})
      : super(text, style: _theme.titleSmall!.merge(style), textAlign: align);

  StyledText.labelLarge(text,
      {TextStyle style = const TextStyle(), TextAlign align = TextAlign.start})
      : super(text, style: _theme.labelLarge!.merge(style), textAlign: align);
  StyledText.labelMedium(text,
      {TextStyle style = const TextStyle(), TextAlign align = TextAlign.start})
      : super(text, style: _theme.labelMedium!.merge(style), textAlign: align);
  StyledText.labelSmall(text,
      {TextStyle style = const TextStyle(), TextAlign align = TextAlign.start})
      : super(text, style: _theme.labelSmall!.merge(style), textAlign: align);

  StyledText.bodyLarge(text,
      {TextStyle style = const TextStyle(), TextAlign align = TextAlign.start})
      : super(text, style: _theme.bodyLarge!.merge(style), textAlign: align);
  StyledText.bodyMedium(text,
      {TextStyle style = const TextStyle(), TextAlign align = TextAlign.start})
      : super(text, style: _theme.bodyMedium!.merge(style), textAlign: align);
  StyledText.bodySmall(text,
      {TextStyle style = const TextStyle(), TextAlign align = TextAlign.start})
      : super(text, style: _theme.bodySmall!.merge(style), textAlign: align);
}
