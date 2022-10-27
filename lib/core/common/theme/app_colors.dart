import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {

  static AppColors? _current;
  static AppColors get current => _current ?? _defaultLightColors;
  static set current(value) => _current = value;

  AppColors(
      {required this.primary,
      required this.secondary,
      required this.primaryLight,
      required this.text,
      required this.dimmed,
      required this.dimmedLight,
      required this.accent,
      required this.accentLight,
      required this.error,
      required this.background,
      required this.neutral,
      required this.success,
      required this.transparent,
        required this.logo,
      });

  Color primary;
  Color secondary;
  Color primaryLight;
  Color accent;
  Color accentLight;
  Color error;
  Color text;
  Color neutral;
  Color background;
  Color dimmed;
  Color dimmedLight;
  Color success;
  Color transparent;
  Color logo;
}

var _defaultLightColors = AppColors(
  background: const Color.fromRGBO(245, 246, 240, 1),
  secondary:const Color(0xffCB7FE6),
  accent: const Color(0xffF47321),
  accentLight: const Color(0xfff79355),
  error: const Color.fromRGBO(0, 0, 0, 0.1),
  text: const Color.fromRGBO(37, 47, 61, 1),
  primaryLight: const Color(0xff095f64),
  primary: const Color(0xffFDC53A),
  dimmedLight: const Color(0xff979797),
  dimmed: const Color(0xffF9F9F9),
  success: const Color(0xff840200),
  neutral: const Color(0xffFFFFFF),
  transparent: Colors.transparent,
  logo: const Color.fromRGBO(239, 197, 89, 0.27),
);
