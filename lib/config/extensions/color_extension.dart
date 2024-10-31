import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

extension LogExtension<T> on T {
  void log() {
    if (kDebugMode) {
      print('----------------\n${toString()}\n-----------------------------');
    }
  }
}