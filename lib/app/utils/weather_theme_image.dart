import '../core/constants/images_constants.dart';

class WhetherThemeImage {
  static String getImageAsset({required double temp}) {
    if (temp >= 35) return ImagesConstants.weightHot;
    if (28 <= temp && temp < 34) return ImagesConstants.weightHot;
    if (27 <= temp && temp < 29) return ImagesConstants.hot;
    if (20 <= temp && temp < 27) return ImagesConstants.doux;
    return ImagesConstants.ice;
  }
}
