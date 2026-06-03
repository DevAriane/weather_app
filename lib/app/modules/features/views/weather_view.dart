import 'package:flutter/material.dart';
import 'package:getxtra/get.dart';
import '../../../core/constants/images_constants.dart';
import '../../../global_widgets/hourly_temperature.dart';
import '../../../global_widgets/temperature.dart';
import '../../../utils/weather_image.dart';
import '../../../utils/weather_theme_linear.dart';
import '../../../utils/weather_theme_image.dart';
import '../controllers/weather_controller.dart';
import '../../../global_widgets/build_all_day.dart';
import '../../../core/constants/app_bar_color_constants.dart';
import 'package:flutter/services.dart';
import '../../../global_widgets/weekly_forecast.dart';

class WeatherView extends StatelessWidget {
  const WeatherView({super.key});

  @override
  Widget build(BuildContext context) {
    final WeatherController controller = Get.put(WeatherController());

    return Obx(() {
      Color mainColor = const Color(0xFF8BA9DF);

      if (!controller.isLoading.value && controller.weatherData.value != null) {
        final currentTemp = controller.weatherData.value!.current.temperature2m;

        if (currentTemp >= 30) {
          mainColor = AppBarColorConstants.soleilH;
        } else if (currentTemp >= 28 && currentTemp < 30) {
          mainColor = AppBarColorConstants.crepusculeH;
        } else if (currentTemp >= 22 && currentTemp < 28) {
          mainColor = AppBarColorConstants.nuitH;
        } else if (currentTemp >= 0 && currentTemp < 22) {
          mainColor = AppBarColorConstants.pluieH;
        } else {
          mainColor = AppBarColorConstants.neigeH;
        }
      }

      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarColor: mainColor,
          statusBarIconBrightness: Brightness.light,
        ),
      );

      return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(7.0),
          child: AppBar(backgroundColor: mainColor, elevation: 0),
        ),
        body: () {
          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.white),
            );
          }

          if (controller.errorMessage.isNotEmpty) {
            return Center(
              child: Text(
                controller.errorMessage.value,
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          final weather = controller.weatherData.value!;
          final currentTemp = weather.current.temperature2m;

          return SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          WhetherThemeImage.getImageAsset(temp: currentTemp),
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Transform.translate(
                          offset: const Offset(-8, 6),
                          child: Temperature(
                            temperature: currentTemp,
                            latitude: weather.latitude,
                            longitude: weather.longitude,
                          ),
                        ),
                        const SizedBox(height: 200),

                        HourlyTemperature(weather: weather),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 24,
                            ),
                            child: SingleChildScrollView(
                              physics: const AlwaysScrollableScrollPhysics(),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Tomorrow's temperature",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  const SizedBox(height: 5),
                                  const Text(
                                    "Almost equal to today",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  const SizedBox(height: 10),
                                  WeeklyForecast(weather: weather),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }(),
      );
    });
  }
}
