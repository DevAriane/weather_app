class Minutely15 {
  final List<String> time;
  final List<double> temperature2m;
  final List<int> weatherCode;

  Minutely15({
    required this.time,
    required this.temperature2m,
    required this.weatherCode,
  });

  factory Minutely15.fromJson(Map<String, dynamic> json) {
    return Minutely15(
      time: List<String>.from(json['time']),
      temperature2m: (json['temperature_2m'] as List)
          .map((e) => (e as num).toDouble())
          .toList(),
      weatherCode: List<int>.from(json['weather_code']),
    );
  }
}
