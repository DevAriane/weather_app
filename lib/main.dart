import 'package:flutter/material.dart';
import 'package:getxtra/get.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app/modules/features/views/weather_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather APP',
      theme: ThemeData(textTheme: GoogleFonts.sarabunTextTheme()),
      home: const WeatherView(),
    );
  }
}
