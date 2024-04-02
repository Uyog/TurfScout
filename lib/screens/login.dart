import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:turf_scout/components/button.dart';
import 'package:turf_scout/components/text_field.dart';
import 'package:turf_scout/helper/helper_functions.dart';
import 'package:turf_scout/screens/forgot_pass.dart';
import 'package:turf_scout/screens/home_page.dart';
import 'package:flutter/gestures.dart';
import 'package:turf_scout/screens/sign_up.dart';
import 'package:page_transition/page_transition.dart';

class Login extends StatefulWidget {
  final void Function()? onTap;
  const Login({super.key,

  required this.onTap,

  });

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

final TextEditingController emailcontroller = TextEditingController();
final TextEditingController passwordcontroller = TextEditingController();

void login () async {
  showDialog(
    context: context, 
    builder: (context) => const Center(
      child: CircularProgressIndicator(),
    ));

try {
  await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: emailcontroller.text,
     password: passwordcontroller.text
     );
     if (context.mounted) Navigator.pop(context);
}

on FirebaseAuthException catch (e) {
  Navigator.pop(context);
  displayMessageToUser(e.code, context);
}
}


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      
      backgroundColor:const Color(0xff121212),
      body: Center(
        child: SingleChildScrollView( 
        scrollDirection: Axis.vertical,
          child: Column(
            
            children: [
              Padding(padding: const EdgeInsets.all(50.0),
              child: Center(
                child: Column(
                  children: [
                     const Text("Welcome to TurfScout",  textAlign: TextAlign.center, style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600, color: Color(0xff97FB57)),),
          
                     const SizedBox(height: 20,),
          
                    MyTextField(
                      hintText: "Email", 
                      labeltext: 'Email', 
                      obscureText: false, 
                      controller: emailcontroller, 
                      prefixIcon: const Icon(Icons.email)),

                        const SizedBox(height: 20,),

                        MyTextField(
                          hintText: 'Password', 
                          labeltext: "Password", 
                          obscureText: true, 
                          controller: passwordcontroller, 
                          prefixIcon: const Icon(Icons.password)),

                           const SizedBox(height: 20,),
          
               MyButton(text: "Login", onTap: login ),
          
                      const SizedBox(height: 10,),
          
                       Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account?", style: TextStyle(color: Color(0xff97FB57),),),
                          const SizedBox(width: 10,),
                           GestureDetector(
                            onTap: widget.onTap,
                            child: const Text('Sign Up', style: TextStyle(color: Color(0xff97FB57), fontWeight: FontWeight.bold),))
                        ],
                      ),
          
                             const SizedBox(height: 10,),
          
                           
                           
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
        ),
      ),
      
    );
  }
}