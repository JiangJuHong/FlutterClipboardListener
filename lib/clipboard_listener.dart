import 'dart:async';

import 'package:flutter/services.dart';

class ClipboardListener {
  static const MethodChannel _channel =
      const MethodChannel('clipboard_listener');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
