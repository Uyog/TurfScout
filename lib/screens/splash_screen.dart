import 'package:turf_scout/auth/auth.dart';
import 'package:turf_scout/main.dart';
import 'package:turf_scout/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';



void main() => runApp(const MyApp());

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: Expanded(child: Image.asset('assets/images/4iwSpd-LogoMakr.png', width: 10000, height: 10000,)),
        
        nextScreen: const Authorization(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor:const  Color(0xff121212),
        duration: 800,
      ),
    );
  }
}