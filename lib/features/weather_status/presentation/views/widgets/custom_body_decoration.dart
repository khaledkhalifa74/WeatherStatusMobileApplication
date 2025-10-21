import 'package:flutter/material.dart';
import 'package:weather_status_app/core/utils/colors.dart';

BoxDecoration customBodyDecoration() {
  return const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [kFirstGradientBodyColor, kSecondGradientBodyColor],
    ),
  );
}
