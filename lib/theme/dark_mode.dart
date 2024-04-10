import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
     brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: const Color(0xff121212),
    primary: const Color(0xff97FB57),
    secondary:const Color(0xff121212),
    inversePrimary: Colors.grey.shade200,
  ),
  textTheme: ThemeData.light().textTheme.apply(
    bodyColor: Colors.grey[300],
    displayColor: Colors.white
  ),
);