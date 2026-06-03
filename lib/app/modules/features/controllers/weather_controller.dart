import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:getxtra/get.dart';
import '../../../data/models/weather_entity.dart';
import 'dart:async';
import 'package:geolocator/geolocator.dart';

class WeatherController extends GetxController {
  final weatherData = Rxn<WeatherEntity>();
  final isLoading = true.obs;
  final errorMessage = ''.obs;
  final cityName = 'Ville...'.obs;

  @override
  void onInit() {
    super.onInit();
    requestLocationAndFetch();
  }

  Future<void> requestLocationAndFetch() async {
    isLoading.value = true;
    errorMessage.value = '';

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      bool? shouldRequest = await _showPermissionExplanationDialog();
      if (shouldRequest == true) {
        permission = await Geolocator.requestPermission();
      } else {
        errorMessage.value = 'Permission de localisation refusée.';
        isLoading.value = false;
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      _showPermissionDeniedForeverDialog();
      isLoading.value = false;
      return;
    }

    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      _showGpsDisabledDialog();
      isLoading.value = false;
      return;
    }

    try {
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      );
      await fetchWeather(position.latitude, position.longitude);
    } catch (e) {
      errorMessage.value = 'Erreur de position : $e';
      isLoading.value = false;
    }
  }

  Future<void> fetchWeather(double lat, double lon) async {
    final String url =
        "https://api.open-meteo.com/v1/forecast"
        "?latitude=$lat"
        "&longitude=$lon"
        "&current=temperature_2m,relative_humidity_2m,wind_speed_10m"
        "&minutely_15=temperature_2m,weather_code"
        "&forecast_minutely_15=1"
        "&daily=temperature_2m_max,temperature_2m_min"
        "&forecast_days=7"
        "&timezone=auto";

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        weatherData.value = WeatherEntity.fromJson(jsonResponse);
        errorMessage.value = '';
      } else {
        errorMessage.value = 'Erreur serveur : ${response.statusCode}';
      }
    } catch (e) {
      errorMessage.value = 'Impossible de se connecter à l\'API : $e';
    } finally {
      isLoading.value = false;
    }
  }

  Future<bool?> _showPermissionExplanationDialog() {
    return showDialog<bool>(
      context: Get.context!,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        title: const Text('Localisation nécessaire'),
        content: const Text(
          'Pour afficher la météo de votre position actuelle, '
          'l’application a besoin d’accéder à votre localisation.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Refuser'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Autoriser'),
          ),
        ],
      ),
    );
  }

  void _showPermissionDeniedForeverDialog() {
    showDialog(
      context: Get.context!,
      builder: (ctx) => AlertDialog(
        title: const Text('Permission refusée'),
        content: const Text(
          'Vous avez refusé définitivement l’accès à la localisation.\n'
          'Veuillez l’activer dans les paramètres de l’application.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Annuler'),
          ),
          TextButton(
            onPressed: () {
              Geolocator.openAppSettings();
              Navigator.pop(ctx);
            },
            child: const Text('Ouvrir les paramètres'),
          ),
        ],
      ),
    );
  }

  void _showGpsDisabledDialog() {
    showDialog(
      context: Get.context!,
      builder: (ctx) => AlertDialog(
        title: const Text('GPS désactivé'),
        content: const Text(
          'La localisation de votre téléphone est désactivée.\n'
          'Veuillez l’activer pour obtenir la météo.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Annuler'),
          ),
          TextButton(
            onPressed: () {
              Geolocator.openLocationSettings();
              Navigator.pop(ctx);
            },
            child: const Text('Activer le GPS'),
          ),
        ],
      ),
    );
  }
}
