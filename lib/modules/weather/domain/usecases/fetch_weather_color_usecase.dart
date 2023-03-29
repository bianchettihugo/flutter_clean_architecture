import 'package:flutter/material.dart';

abstract class FetchWeatherColorUsecase {
  Color call({required int weatherCode});
}

class FetchWeatherColorUsecaseImpl extends FetchWeatherColorUsecase {
  FetchWeatherColorUsecaseImpl();

  final _colors = {
    0: const Color(0xffCEB0A0),
    1: const Color(0xff837EDE),
    2: const Color(0xff837EDE),
    3: const Color(0xff837EDE),
    45: const Color(0xff6D67D0),
    48: const Color(0xff6D67D0),
    51: const Color(0xff4550B2),
    53: const Color(0xff4550B2),
    55: const Color(0xff4550B2),
    56: const Color(0xff4550B2),
    57: const Color(0xff4550B2),
    61: const Color(0xff333B87),
    63: const Color(0xff333B87),
    65: const Color(0xff333B87),
    66: const Color(0xff333B87),
    67: const Color(0xff333B87),
    71: const Color(0xff809DBE),
    73: const Color(0xff809DBE),
    75: const Color(0xff809DBE),
    77: const Color(0xff809DBE),
    80: const Color(0xff4550B2),
    81: const Color(0xff4550B2),
    82: const Color(0xff4550B2),
    85: const Color(0xff809DBE),
    86: const Color(0xff809DBE),
    95: const Color(0xff333B87),
    96: const Color(0xff333B87),
    99: const Color(0xff333B87),
  };

  @override
  Color call({required int weatherCode}) {
    return _colors[weatherCode] ?? const Color(0xff6D67D0);
  }
}
