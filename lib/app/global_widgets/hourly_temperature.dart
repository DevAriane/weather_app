import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../core/constants/images_constants.dart';

class HourlyTemperature extends StatelessWidget {
  HourlyTemperature({super.key});

  final List<Map<String, dynamic>> hourlyTemperature = [
    {"hour": "17:00", "icon": ImagesConstants.sunny, "temperature": "30°"},
    {"hour": "17:30", "icon": ImagesConstants.sunny, "temperature": "30°"},
    {
      "hour": "18:00",
      "icon": ImagesConstants.partlyCloudy,
      "temperature": "30°",
    },
    {"hour": "18:30", "icon": ImagesConstants.cloudyAT, "temperature": "30°"},
    {"hour": "19:00", "icon": ImagesConstants.cloudyAT, "temperature": "30°"},
    {"hour": "19:30", "icon": ImagesConstants.partlyCN, "temperature": "30°"},
    {"hour": "20:00", "icon": ImagesConstants.partlyCN, "temperature": "30°"},
    {"hour": "20:30", "icon": ImagesConstants.cloudyCATN, "temperature": "30°"},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, top: 220),
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
              children: hourlyTemperature.map((h) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      Text(
                        h["hour"],
                        style: const TextStyle(
                          fontSize: 10,
                          color: Color(0xFF474747),
                        ),
                      ),
                      const SizedBox(height: 5),
                      SvgPicture.asset(
                        h["icon"],
                        height: 18,
                        colorFilter: const ColorFilter.mode(
                          Color(0xFF474747),
                          BlendMode.srcIn,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        h["temperature"],
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF474747),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
