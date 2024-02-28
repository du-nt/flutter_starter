import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signals/signals_flutter.dart';

final isDarkMode = signal<bool>(false);
final themeMode =
    computed(() => isDarkMode.value ? ThemeMode.dark : ThemeMode.light);

Future<dynamic> initializeTheme() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? savedThemeMode = prefs.getString('isDarkMode');
  isDarkMode.value = savedThemeMode == 'true';
}

void changeTheme() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  isDarkMode.value = !isDarkMode.value;
  await prefs.setString('isDarkMode', '${isDarkMode.value}');
}
