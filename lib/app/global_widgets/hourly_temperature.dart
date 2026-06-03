import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../core/constants/images_constants.dart';
import '../data/models/weather_entity.dart';
import '../utils/weather_text.dart';

class HourlyTemperature extends StatelessWidget {
  final double temperature;
  final WeatherEntity weather;

  const HourlyTemperature({
    super.key,
    required this.weather,
    required this.temperature,
  });

  String _getHourlyIconFromCode(int code) {
    if (code == 0) return ImagesConstants.sunny;
    if (code <= 3) return ImagesConstants.partlyCloudy;
    if (code <= 65) return ImagesConstants.cloudyAT;
    return ImagesConstants.partlyCN;
  }

  String _formatHour(String rawDateTime) {
    return rawDateTime.split('T').last;
  }

  @override
  Widget build(BuildContext context) {
    final minutelyData = weather.minutely15;

    if (minutelyData == null || minutelyData.time.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(child: Text("Données météo indisponibles")),
      );
    }

    final List<String> filteredHours = [];
    final List<double> filteredTemps = [];
    final List<int> filteredCodes = [];

    for (int i = 0; i < minutelyData.time.length; i++) {
      if (i % 2 == 0) {
        filteredHours.add(minutelyData.time[i]);
        filteredTemps.add(minutelyData.temperature2m[i]);
        filteredCodes.add(minutelyData.weatherCode[i]);
      }
    }

    return Container(
      margin: const EdgeInsets.only(left: 15, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              WeatherText.getImageAsset(temp: temperature),
              style: const TextStyle(fontSize: 12, color: Color(0xFF474747)),
            ),
          ),
          const SizedBox(height: 15),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(filteredHours.length, (index) {
                final String rawHour = filteredHours[index];
                final double currentTemp = filteredTemps[index];
                final int currentCode = filteredCodes[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      Text(
                        _formatHour(rawHour),
                        style: const TextStyle(
                          fontSize: 10,
                          color: Color(0xFF474747),
                        ),
                      ),
                      const SizedBox(height: 5),

                      SvgPicture.asset(
                        _getHourlyIconFromCode(currentCode),
                        height: 18,
                        colorFilter: const ColorFilter.mode(
                          Color(0xFF474747),
                          BlendMode.srcIn,
                        ),
                      ),
                      const SizedBox(height: 5),

                      Text(
                        "${currentTemp.round()}°",
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF474747),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
