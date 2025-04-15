// 📁 lib/theme/theme_provider.dart
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  bool _followSystem = true;

  ThemeMode get themeMode => _themeMode;
  bool get followSystem => _followSystem;

  void toggleFollowSystem(bool value) {
    _followSystem = value;
    if (value) {
      final brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
      _themeMode = brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
    }
    notifyListeners();
  }

  void toggleTheme(bool isDark) {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
} 