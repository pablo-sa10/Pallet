import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier{
  bool _isDark = false;

  ThemeProvider(bool isDark){
    _loadTheme();
  }

  bool get isDarkTheme => _isDark;

  void toggleTheme(){
    _isDark = !_isDark;
    _saveTheme();
    notifyListeners();
  }

  void _loadTheme()async{
    final prefs = await SharedPreferences.getInstance();
    _isDark = prefs.getBool('isDarkTheme') ?? false;
    notifyListeners();
  }

  void _saveTheme()async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkTheme', _isDark);
  }
}