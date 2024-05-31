import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  bool _isDark = false;

  bool get isDarkTheme => _isDark;

  void toggleTheme(){
    _isDark = !_isDark;
    notifyListeners();
  }
}