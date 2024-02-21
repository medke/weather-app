import 'package:flutter/foundation.dart';

enum Flavor {
  kPROD,
  kDEV,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static bool get isDevOrDebug => kDebugMode || appFlavor == Flavor.kDEV;

  static String get title {
    switch (appFlavor) {
      case Flavor.kPROD:
        return 'Weather App';
      case Flavor.kDEV:
        return 'Weather App Dev';
      default:
        return 'Weather App Unknown Flavor';
    }
  }
}
