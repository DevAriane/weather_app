class CurrentUnits {
  final String time;
  final String interval;
  final String temperature2m;
  final String windSpeed10m;

  CurrentUnits({
    required this.time,
    required this.interval,
    required this.temperature2m,
    required this.windSpeed10m,
  });

  factory CurrentUnits.fromJson(Map<String, dynamic> json) {
    return CurrentUnits(
      time: json['time'] as String,
      interval: json['interval'] as String,
      temperature2m: json['temperature_2m'] as String,
      windSpeed10m: json['wind_speed_10m'] as String,
    );
  }
}