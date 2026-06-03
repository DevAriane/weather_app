import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../core/constants/images_constants.dart';
import '../data/models/weather_entity.dart';

class HourlyTemperature extends StatelessWidget {
  final WeatherEntity weather;

  const HourlyTemperature({super.key, required this.weather});

  String _getHourlyIcon(double temp) {
    if (temp >= 30) return ImagesConstants.sunny;
    if (temp >= 25) return ImagesConstants.partlyCloudy;
    if (temp >= 20) return ImagesConstants.cloudyAT;
    return ImagesConstants.partlyCN;
  }

  String _formatHour(String rawDateTime) {
    return rawDateTime.split('T').last;
  }

  @override
  Widget build(BuildContext context) {
    final List<String> hoursList = weather.hourly.time;
    final List<double> tempsList = weather.hourly.temperature2m;

    return Container(
      margin: const EdgeInsets.only(left: 15, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              "Low of 23 degrees, very clear skies.",
              style: TextStyle(fontSize: 12, color: Color(0xFF474747)),
            ),
          ),
          const SizedBox(height: 15),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.min,

              children: List.generate(hoursList.length, (index) {
                final String rawHour = hoursList[index];
                final double currentTemp = tempsList[index];

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
                        _getHourlyIcon(currentTemp),
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
