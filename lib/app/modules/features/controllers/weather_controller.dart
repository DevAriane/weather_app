import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:getxtra/get.dart';
import '../../../data/models/weather_entity.dart';

class WeatherController extends GetxController {
  final weatherData = Rxn<WeatherEntity>();
  final isLoading = true.obs;
  final errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchWeather();
  }

  Future<void> fetchWeather() async {
    const url =
        "https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&current=temperature_2m,wind_speed_10m&hourly=temperature_2m,relative_humidity_2m,wind_speed_10m";

    try {
      isLoading(true);
      errorMessage('');

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        weatherData.value = WeatherEntity.fromJson(jsonResponse);
      } else {
        errorMessage.value = 'Erreur serveur : ${response.statusCode}';
      }
    } catch (e) {
      errorMessage.value = 'Impossible de se connecter à l\'API : $e';
    } finally {
      isLoading(false);
    }
  }
}
