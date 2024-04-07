import 'package:flutter/material.dart';
import 'package:turf_scout/auth/auth.dart';
import 'package:turf_scout/auth/login_sign_up.dart';
import 'package:turf_scout/screens/account_page.dart';
import 'package:turf_scout/screens/events_calendar.dart';
import 'package:turf_scout/screens/football_page.dart';
import 'package:turf_scout/screens/home_page.dart';
import 'package:turf_scout/screens/settings.dart';
import 'package:turf_scout/screens/shop.dart';
import 'package:turf_scout/screens/tennis_page.dart';
import 'package:turf_scout/screens/trainers.dart';
import 'package:turf_scout/theme/dark_mode.dart';
import 'package:turf_scout/theme/light_mode.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FanBase',
        home: const Authorization(),
         theme: lightMode,
        darkTheme: darkMode,
        routes: {
          '/account_page':(context) =>  AccountPage(),
          '/events_calendar':(context) => const EventsCalendar(),
          '/shop':(context) => const ShopPage(),
          '/settings': (context) => const SettingsPage(),
          '/login_sign_up': (context) => const LoginOrSignUp(),
          '/tennis_page':(context) => const TennisPage(),
          '/home' :(context) => const HomePage(),
          
        },
        );
  }
}
