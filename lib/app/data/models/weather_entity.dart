import 'package:meteo_app/app/data/models/daily.dart';

import 'current.dart';
import 'current_units.dart';
import 'minutely15.dart';

class WeatherEntity {
  final double latitude;
  final double longitude;
  final double generationtimeMs;
  final int utcOffsetSeconds;
  final String timezone;
  final String timezoneAbbreviation;
  final double elevation;
  final CurrentUnits currentUnits;
  final Current current;
  final Minutely15? minutely15;
  final Daily daily;

  WeatherEntity({
    required this.latitude,
    required this.longitude,
    required this.generationtimeMs,
    required this.utcOffsetSeconds,
    required this.timezone,
    required this.timezoneAbbreviation,
    required this.elevation,
    required this.currentUnits,
    required this.current,
    this.minutely15,
    required this.daily,
  });

  factory WeatherEntity.fromJson(Map<String, dynamic> json) {
    return WeatherEntity(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      generationtimeMs: (json['generationtime_ms'] as num).toDouble(),
      utcOffsetSeconds: json['utc_offset_seconds'] as int,
      timezone: json['timezone'] as String,
      timezoneAbbreviation: json['timezone_abbreviation'] as String,
      elevation: (json['elevation'] as num).toDouble(),
      currentUnits: CurrentUnits.fromJson(json['current_units']),
      current: Current.fromJson(json['current']),

      minutely15: json['minutely_15'] != null
          ? Minutely15.fromJson(json['minutely_15'])
          : null,

      daily: json['daily'] != null
          ? Daily.fromJson(json['daily'])
          : Daily(time: [], temperature2mMax: [], temperature2mMin: []),
    );
  }
}
