import 'package:flutter/material.dart';

class WeatherText {
  static String getImageAsset({required double temp}) {
    if (temp >= 35) {
      return "À ${temp}°C, il fait très chaud";
    } else if (temp >= 28) {
      return "À ${temp}°C, il fait chaud";
    } else if (temp >= 25) {
    
      return "À ${temp}°C, le climat est favorable";
    } else if (temp >= 15) {
      
      return "À ${temp}°C, les pluies sont abondantes";
    } else {
      
      return "À ${temp}°C, il neige et le vent est très glacial";
    }
  }
}