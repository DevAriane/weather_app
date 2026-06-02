import 'package:flutter/material.dart';
import '../../../global_widgets/app_bar.dart';
import '../../../core/constants/app_bar_color_constants.dart';
import '../../../core/constants/images_constants.dart';
import '../../../global_widgets/temperature.dart';
import '../../../global_widgets/hourly_temperature.dart';

class WeatherView extends StatelessWidget {
  const WeatherView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(10.0),
        child: AppBar(backgroundColor: const Color(0xFF8BA9DF)),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImagesConstants.hot),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(children: [const Temperature(), HourlyTemperature()]),
        ),
      ),
    );
  }
}
