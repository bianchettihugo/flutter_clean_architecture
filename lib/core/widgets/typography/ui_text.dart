// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/widgets/typography/typography.dart';

class UIText extends Text {
  const UIText(text, {TextStyle? style}) : super(text, style: style);

  UIText.lead(text,
      {TextStyle style = const TextStyle(), TextAlign align = TextAlign.start})
      : super(text, style: AppTypography.lead.merge(style), textAlign: align);

  UIText.tiny(text,
      {TextStyle style = const TextStyle(), TextAlign align = TextAlign.start})
      : super(text, style: AppTypography.tiny.merge(style), textAlign: align);

  UIText.small(text,
      {TextStyle style = const TextStyle(), TextAlign align = TextAlign.start})
      : super(text, style: AppTypography.small.merge(style), textAlign: align);

  UIText.block(text,
      {TextStyle style = const TextStyle(), TextAlign align = TextAlign.start})
      : super(text, style: AppTypography.block.merge(style), textAlign: align);

  UIText.body1(text,
      {TextStyle style = const TextStyle(), TextAlign align = TextAlign.start})
      : super(text, style: AppTypography.body1.merge(style), textAlign: align);

  UIText.body2(text,
      {TextStyle style = const TextStyle(), TextAlign align = TextAlign.start})
      : super(text, style: AppTypography.body2.merge(style), textAlign: align);

  UIText.heading1(text,
      {TextStyle style = const TextStyle(), TextAlign align = TextAlign.start})
      : super(text,
            style: AppTypography.heading1.merge(style), textAlign: align);

  UIText.heading2(text,
      {TextStyle style = const TextStyle(), TextAlign align = TextAlign.start})
      : super(text,
            style: AppTypography.heading2.merge(style), textAlign: align);

  UIText.heading3(text,
      {TextStyle style = const TextStyle(), TextAlign align = TextAlign.start})
      : super(text,
            style: AppTypography.heading3.merge(style), textAlign: align);

  UIText.heading4(text,
      {TextStyle style = const TextStyle(), TextAlign align = TextAlign.start})
      : super(text,
            style: AppTypography.heading4.merge(style), textAlign: align);

  UIText.heading5(text,
      {TextStyle style = const TextStyle(), TextAlign align = TextAlign.start})
      : super(text,
            style: AppTypography.heading5.merge(style), textAlign: align);

  UIText.heading6(text,
      {TextStyle style = const TextStyle(), TextAlign align = TextAlign.start})
      : super(text,
            style: AppTypography.heading6.merge(style), textAlign: align);

  UIText.captalized(text,
      {TextStyle style = const TextStyle(), TextAlign align = TextAlign.start})
      : super(text,
            style: AppTypography.captalized.merge(style), textAlign: align);
}
