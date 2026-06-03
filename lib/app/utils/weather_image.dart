import '../core/constants/images_constants.dart';

class WeatherImage {
  static String getImageAsset({required double temp}) {
    if (temp >= 30) return ImagesConstants.soleil;
    if (temp >= 28 && temp < 30) return ImagesConstants.soleil;
    if (temp >= 22 && temp < 28) return ImagesConstants.nuit;
    if (temp >= 0 && temp < 22) return ImagesConstants.pluie;
    return ImagesConstants.neige;
  }
}
