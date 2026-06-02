class Hourly {
  final List<String> time;
  final List<double> temperature2m;
  final List<int> relativeHumidity2m;
  final List<double> windSpeed10m;

  Hourly({
    required this.time,
    required this.temperature2m,
    required this.relativeHumidity2m,
    required this.windSpeed10m,
  });

  factory Hourly.fromJson(Map<String, dynamic> json) {
    return Hourly(
      time: List<String>.from(json['time']),
      temperature2m: (json['temperature_2m'] as List).map((e) => (e as num).toDouble()).toList(),
      relativeHumidity2m: List<int>.from(json['relative_humidity_2m']),
      windSpeed10m: (json['wind_speed_10m'] as List).map((e) => (e as num).toDouble()).toList(),
    );
  }
}