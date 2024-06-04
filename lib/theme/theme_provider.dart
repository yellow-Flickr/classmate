
import 'package:classmate/theme/dark_mode.dart';
import 'package:classmate/theme/light_mode.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == darkMode;

  bool get isEchoLightMode => _themeData == echoLightMode;

  bool get isEchoDarkMode => _themeData == echoDarkMode;

  set themeData(ThemeData themeData) {
    _themeData = themeData;

    notifyListeners();
  }

 
}
