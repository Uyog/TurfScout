// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:turf_scout/components/button.dart';
import 'package:turf_scout/components/text_field.dart';
import 'package:turf_scout/helper/helper_functions.dart';
import 'package:turf_scout/screens/forgot_pass.dart';
import 'package:flutter/gestures.dart';


class Login extends StatefulWidget {
  final void Function()? onTap;
  const Login({super.key,

  required this.onTap,

  });

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  bool _isHidden = true;

void _togglePasswordView(){
      setState(() {
        _isHidden = !_isHidden;
        });
      }

final TextEditingController emailcontroller = TextEditingController();
final TextEditingController passwordcontroller = TextEditingController();

void login () async {
  showDialog(
    context: context, 
    builder: (context) => const Center(
      child: CircularProgressIndicator(),
    )
    );

try {
  await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: emailcontroller.text,
     password: passwordcontroller.text
     );
      Navigator.pop(context);
}

on FirebaseAuthException catch (e) {
  Navigator.pop(context);
  displayMessageToUser(e.code, context);
}
}



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      
      backgroundColor:Theme.of(context).colorScheme.background,
      body: Center(
        child: SingleChildScrollView( 
        scrollDirection: Axis.vertical,
          child: Column(
            
            children: [
              Padding(padding: const EdgeInsets.all(50.0),
              child: Center(
                child: Column(
                  children: [
                     Text("Welcome to TurfScout",  
                     textAlign: TextAlign.center, 
                     style: TextStyle(
                      fontSize: 30, 
                      fontWeight: FontWeight.w600, 
                      color: Theme.of(context).colorScheme.primary,),),
          
                     const SizedBox(height: 20,),
                     
          
                    MyTextField(
                      hintText: "Email", 
                      labeltext: 'Email', 
                      obscureText: false, 
                      controller: emailcontroller, 
                      prefixIcon: const Icon(Icons.email),
                      suffixIcon: null
                      
                      ),
                      

                        const SizedBox(height: 20,),

                        MyTextField(
                          hintText: 'Password', 
                          labeltext: "Password", 
                          obscureText: _isHidden, 
                          controller: passwordcontroller, 
                          prefixIcon: const Icon(Icons.password),
                          suffixIcon: InkWell( 
                            onTap: _togglePasswordView,
                            child: Icon(
                              _isHidden
                              ? Icons.visibility
                              : Icons.visibility_off)
                          ),),
                          
                           const SizedBox(height: 20,),
          
               MyButton(text: "Login", onTap: login ),
          
                      const SizedBox(height: 10,),
          
                       Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account?", style: TextStyle(color:Theme.of(context).colorScheme.primary,),),
                          const SizedBox(width: 10,),
                           GestureDetector(
                            onTap: widget.onTap,
                            child:  Text('Sign Up', style: TextStyle(color:Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold),))
                        ],
                      ),
          
                             const SizedBox(height: 10,),
          
                           
                           
                      const SizedBox(height: 30,),
          
                          RichText(
                          text:  TextSpan(                            
                            children:  <TextSpan>[
                            TextSpan(text: 'Forgot Password?', style:  TextStyle(color: Theme.of(context).colorScheme.primary,), 
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
                          text:  TextSpan(                            
                            children:  <TextSpan>[
                             TextSpan(text: '© Terms and Conditions',style: TextStyle(color: Theme.of(context).colorScheme.primary, )),
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