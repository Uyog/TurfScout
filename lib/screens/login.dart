import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:turf_scout/screens/forgot_pass.dart';
import 'package:turf_scout/screens/home_page.dart';
import 'package:flutter/gestures.dart';
import 'package:turf_scout/screens/sign_up.dart';
import 'package:page_transition/page_transition.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      
      backgroundColor:const Color(0xff121212),
      body: Column(
        
        children: [
          Padding(padding: const EdgeInsets.all(100.0),
          child: Center(
            child: Column(
              children: [
                 const Text("Welcome to TurfScout",  textAlign: TextAlign.center, style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600, color: Color(0xff97FB57)),),

                 const SizedBox(height: 20,),

                 const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Username", 
                    hintStyle: TextStyle(color: Color(0xff97FB57)),
                    label: Text("Username"),
                    prefixIcon: Icon(CupertinoIcons.person_circle, color: Color(0xff97FB57),)
                    ),),

                    const SizedBox(height: 20,),

                     const TextField(
                      obscureText: true, style: TextStyle(color: Color(0xff97FB57)),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Password", hintStyle: TextStyle(color: Color(0xff97FB57)),
                    label: Text("Password"),
                    prefixIcon: Icon(Icons.password_rounded, color: Color(0xff97FB57),),
                    ),),

                    const SizedBox(height: 20,),

                      ElevatedButton(
                        style: ButtonStyle(
                         backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff97FB57)), 
                             ),
              child: const Text('Login', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff121212)),),
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                    curve: Curves.linear,
                    type: PageTransitionType.bottomToTop,
                    child: const HomePage(),
                  ),
                );
              },
                      ),

                  const SizedBox(height: 10,),

                   RichText(
                      text:  const TextSpan(                            
                        children:  <TextSpan>[
                         TextSpan(text: 'Do not have an account?',style: TextStyle(color: Color(0xff97FB57), )),
                         ], 
                         ), 
                         ), 

                         const SizedBox(height: 10,),

                          ElevatedButton(
                             style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff97FB57)), 
                                  ),
                              
              child: const Text('Sign Up', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff121212)),),
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                    curve: Curves.linear,
                    type: PageTransitionType.bottomToTop,
                    child: const SignUp(),
                  ),
                );
              },
                      ),

                  const SizedBox(height: 30,),

                      RichText(
                      text:  TextSpan(                            
                        children:  <TextSpan>[
                        TextSpan(text: 'Forgot Password?', style: const TextStyle(color: Color(0xff97FB57)), 
                        recognizer: TapGestureRecognizer()..onTap = (){
                          Navigator.pushReplacement(
                            context, 
                            MaterialPageRoute<void>(
                              builder: (BuildContext context)=>const ForgotPassword()));
                              } 
                              ),
 ], 
  ), 
   ), 
             

                         const SizedBox(height: 160,),

                         RichText(
                      text:  const TextSpan(                            
                        children:  <TextSpan>[
                         TextSpan(text: '© Terms and Conditions',style: TextStyle(color: Color(0xff97FB57), )),
                         ], 
                         ), 
                         ), 
              ],
            ),
          ),)
        ],
      ),
      
    );
  }
}