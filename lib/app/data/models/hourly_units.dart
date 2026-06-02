class HourlyUnits {
  final String time;
  final String temperature2m;
  final String relativeHumidity2m;
  final String windSpeed10m;

  HourlyUnits({
    required this.time,
    required this.temperature2m,
    required this.relativeHumidity2m,
    required this.windSpeed10m,
  });

  factory HourlyUnits.fromJson(Map<String, dynamic> json) {
    return HourlyUnits(
      time: json['time'] as String,
      temperature2m: json['temperature_2m'] as String,
      relativeHumidity2m: json['relative_humidity_2m'] as String,
      windSpeed10m: json['wind_speed_10m'] as String,
    );
  }
}