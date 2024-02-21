import 'dart:developer';

import 'package:flutter/foundation.dart' as foundation;
import 'flavors.dart';

printLog(String message, {Object? class_}) {
  if (F.isDevOrDebug) {
    var prefix = class_ == null ? "" : class_.runtimeType.toString();
    if (message.length < 2000) {
      foundation.debugPrintThrottled("$prefix: $message");
    } else {
      log("$prefix: $message");
    }
  }
}
