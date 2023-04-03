import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ScrollBehaviorHelper extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
