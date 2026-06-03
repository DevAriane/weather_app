import '../core/constants/images_constants.dart';

class WhetherThemeImage {
  static String getImageAsset({required double temp}) {
    if (temp >= 30) return ImagesConstants.hot;
    if (temp >= 28 && temp < 30) return ImagesConstants.weightHot;
    if (temp >= 22 && temp < 28) return ImagesConstants.good;
    if (temp >= 0 && temp < 22) return ImagesConstants.doux;
    return ImagesConstants.ice;
  }
}
