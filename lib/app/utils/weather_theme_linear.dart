import 'package:flutter/material.dart';
import '../core/constants/app_bar_color_constants.dart';

class WeatherTheme {
  static LinearGradient getGradient({required double temp}) {
    if (temp >= 30) {
      return const LinearGradient(
        colors: [AppBarColorConstants.soleilH, AppBarColorConstants.soleilB],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
    } else if (temp >= 28 && temp < 30) {
      return const LinearGradient(
        colors: [
          AppBarColorConstants.crepusculeH,
          AppBarColorConstants.crepusculeB,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
    } else if (temp >= 22 && temp < 28) {
      return const LinearGradient(
        colors: [AppBarColorConstants.nuitH, AppBarColorConstants.nuitB],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
    } else if (temp >= 0 && temp < 22) {
      return const LinearGradient(
        colors: [AppBarColorConstants.pluieH, AppBarColorConstants.pluieB],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
    } else {
      return const LinearGradient(
        colors: [AppBarColorConstants.neigeH, AppBarColorConstants.neigeB],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
    }
  }
}

