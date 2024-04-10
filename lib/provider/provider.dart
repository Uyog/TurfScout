
import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier{

  bool _isDark = false;
  bool get isDark => _isDark;


//Custom dark theme 
final darkTheme = ThemeData(
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

// Custom light theme 
final lightTheme = ThemeData(
   brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: const Color(0xffFFFFFF),
    primary: const Color(0xff121212),
    secondary: const Color(0xffFFFFFF),
    inversePrimary: Colors.grey.shade800,
  ),
  textTheme: ThemeData.light().textTheme.apply(
    bodyColor: Colors.grey[800],
    displayColor: Colors.black
  ),
);

//Dark mode toggle action
  changeTheme(){
    _isDark = !isDark;
    notifyListeners();
  }

//Init method of provider
  init(){
    notifyListeners();
  }
}