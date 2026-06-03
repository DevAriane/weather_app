import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meteo_app/app/core/constants/app_bar_color_constants.dart';
import '../core/constants/images_constants.dart';
import '../data/models/weather_entity.dart';

class WeeklyForecast extends StatelessWidget {
  final WeatherEntity weather;

  const WeeklyForecast({super.key, required this.weather});

  String _getDayName(int index, String rawDate) {
    if (index == 0) return "Yesterday";
    if (index == 1) return "Today";

    DateTime date = DateTime.parse(rawDate);
    List<String> weekdays = [
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
      "Sunday",
    ];
    return weekdays[date.weekday - 1];
  }

  @override
  Widget build(BuildContext context) {
    final List<String> dates = weather.daily?.time ?? [];
    final List<double> maxTemps = weather.daily?.temperature2mMax ?? [];
    final List<double> minTemps = weather.daily?.temperature2mMin ?? [];

    if (dates.isEmpty) {
      return const Center(child: Text("Aucune prévision disponible"));
    }

    return ListView.builder(
      itemCount: dates.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 3,
                child: Text(
                  _getDayName(index, dates[index]),
                  style: const TextStyle(
                    color: AppBarColorConstants.texte,
                    fontSize: 14,
                  ),
                ),
              ),

              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      ImagesConstants.sunny,
                      height: 16,
                      colorFilter: const ColorFilter.mode(
                        Colors.black54,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: 8),
                    SvgPicture.asset(
                      ImagesConstants.partlyCN,
                      height: 16,
                      colorFilter: const ColorFilter.mode(
                        Colors.black54,
                        BlendMode.srcIn,
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "${maxTemps[index].round()}°",
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Text(
                      "${minTemps[index].round()}°",
                      style: const TextStyle(color: Colors.black38),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
