import 'package:flutter/material.dart';

class TomorrowTemperature extends StatelessWidget {
  TomorrowTemperature({super.key});

  List<Map<String, dynamic>> temparatuteDay = [];

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          "Tomorrow's temperature",
          style: TextStyle(fontSize: 15, color: Color(0xff474747)),
        ),
        SizedBox(height: 10),
        Text(
          "Almost equal to today",
          style: TextStyle(fontSize: 10, color: Color(0xff474747)),
        ),
        SizedBox(height: 15),
      ],
    );
  }
}
