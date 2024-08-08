import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ThemeService {
  static const String _themeKey = 'theme_key';

  final Box<dynamic> _settingsBox;

  ThemeService(this._settingsBox);

  Future<void> saveThemeMode(ThemeMode? themeMode) async {
    _settingsBox.put(_themeKey, themeMode.toString());
  }

  Future<ThemeMode> getThemeMode() async {
    final theme = await _settingsBox.get(_themeKey);
    if (theme == null) {
      _settingsBox.put('theme', ThemeMode.system.toString());
      return ThemeMode.system;
    }
    return ThemeMode.values.firstWhere((e) => e.toString() == theme);
  }
}
