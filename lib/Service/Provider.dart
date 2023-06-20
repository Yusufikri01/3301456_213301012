import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _selectedTheme = ThemeData();

  ThemeData dark = ThemeData.dark().copyWith(
      appBarTheme: AppBarTheme(
        color: Colors.black12,
          titleTextStyle:
          TextStyle(fontStyle: FontStyle.italic, fontSize: 20)));

  ThemeData light = ThemeData.light().copyWith(
      scaffoldBackgroundColor: Color.fromARGB(255, 192, 204, 192),
      appBarTheme: AppBarTheme(
          color: Color.fromARGB(255, 205, 186, 150),
          titleTextStyle:
          TextStyle(fontStyle: FontStyle.italic, fontSize: 20)));

  ThemeProvider({required bool darkThemeOn}) {
    _selectedTheme = darkThemeOn ? dark : light;
  }

  Future<void> swapTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (_selectedTheme == dark) {
      _selectedTheme = light;
      await prefs.setBool("darkTheme", false);
    } else {
      _selectedTheme = dark;
      await prefs.setBool("darkTheme", true);
    }

    notifyListeners();
  }

  ThemeData getTheme() => _selectedTheme;
}
