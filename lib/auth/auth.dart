import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:turf_scout/auth/login_sign_up.dart';
import 'package:turf_scout/screens/home_page.dart';
import 'package:turf_scout/screens/login.dart';

class Authorization extends StatelessWidget {
  const Authorization({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(), 
        builder: (context, snapshot){
          if (snapshot.hasData){
            return const HomePage();
          }
         else{
          return const LoginOrSignUp();
         }
        }),
    );
  }
}