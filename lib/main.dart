import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turf_scout/auth/auth.dart';
import 'package:turf_scout/auth/login_sign_up.dart';
import 'package:turf_scout/provider/provider.dart';
import 'package:turf_scout/screens/account_page.dart';
import 'package:turf_scout/screens/events_calendar.dart';
import 'package:turf_scout/screens/home_page.dart';
import 'package:turf_scout/screens/settings.dart';
import 'package:turf_scout/screens/shop.dart';
import 'package:turf_scout/theme/light_mode.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => UiProvider()..init(),
      child:
          Consumer<UiProvider>(builder: (context, UiProvider notifier, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'FanBase',
          home: const Authorization(),

          //By default theme settings, you can also set system
          ////when your mobile theme is dark the app also become dark
          themeMode: notifier.isDark ? ThemeMode.dark : ThemeMode.light,

          //Our custom theme applied
          darkTheme: notifier.isDark ? notifier.darkTheme : notifier.lightTheme,
          theme: lightMode,
          routes: {
            '/account_page': (context) => AccountPage(),
            '/events_calendar': (context) => const EventsCalendar(),
            '/shop': (context) => const ShopPage(),
            '/settings': (context) => const SettingsPage(),
            '/login_sign_up': (context) => const LoginOrSignUp(),
            '/home': (context) => const HomePage(),
          },
        );
      }),
    );
  }
}
