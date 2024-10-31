import 'package:flutter/material.dart';

abstract class ColorControl {
  Color get blackWhite;
}

class LightColorControl implements ColorControl {
  @override
  Color get blackWhite => Colors.black;
}

class DarkColorControl implements ColorControl {
  @override
  Color get blackWhite => Colors.white;
}
