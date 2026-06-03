class Current {
  final String time;
  final int interval;
  final double temperature2m;
  final int relativeHumidity2m;
  final double windSpeed10m;

  Current({
    required this.time,
    required this.interval,
    required this.temperature2m,
    required this.relativeHumidity2m,
    required this.windSpeed10m,
  });

  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(
      time: json['time'] as String,
      interval: json['interval'] as int,
      temperature2m: (json['temperature_2m'] as num).toDouble(),
      relativeHumidity2m: json['relative_humidity_2m'] as int,
      windSpeed10m: (json['wind_speed_10m'] as num).toDouble(),
    );
  }
}
