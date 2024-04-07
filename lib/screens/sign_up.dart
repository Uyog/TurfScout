// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:turf_scout/components/button.dart';
import 'package:turf_scout/components/text_field.dart';
import 'package:turf_scout/helper/helper_functions.dart';


class SignUp extends StatefulWidget {
  final void Function()? onTap;
   const SignUp({super.key,
  required this.onTap,
  });

  @override
  State<SignUp> createState() => _SignUpState();
}
class _SignUpState extends State<SignUp> {

final TextEditingController usernamecontroller = TextEditingController();
final TextEditingController emailcontroller = TextEditingController();
final TextEditingController passwordcontroller = TextEditingController();
final TextEditingController confirmPWcontroller = TextEditingController();

bool _isHidden = true;
void _togglePasswordView(){
      setState(() {
        _isHidden = !_isHidden;
        });
      }


void signup() async {
    showDialog(
    context: context, 
    builder: (context) => const Center(
      child: CircularProgressIndicator(),
    ));

    if (passwordcontroller.text != confirmPWcontroller.text) {
      Navigator.pop(context);
      displayMessageToUser("Wrong Password", context);
    } 
    else{

      try {
        UserCredential? userCredential = 
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailcontroller.text, 
          password: passwordcontroller.text
          );

          createUserDocument(userCredential);

      if (context.mounted) Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context);

        displayMessageToUser(e.code, context);
      }
    }
  }

  Future<void> createUserDocument(UserCredential? userCredential) async {
    if(userCredential != null && userCredential.user != null)
    {
      await FirebaseFirestore.instance
      .collection("Users")
      .doc(userCredential.user!.email)
      .set({
        'email': userCredential.user!.email,
        'username': usernamecontroller.text,
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: SingleChildScrollView( 
          scrollDirection: Axis.vertical,
          child: Column( 
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Padding(
              padding: const EdgeInsets.all(50.0),
               
            
          
            child: Center(       
              child: Column(
                children: [ 
                   Text("Sign Up ",  
                  textAlign: TextAlign.center, 
                  style: TextStyle(
                    fontSize: 35, 
                    fontWeight: FontWeight.w600, 
                    color: Theme.of(context).colorScheme.primary,),),
          
                  const SizedBox(height: 20,),
          
                  MyTextField(
                    hintText: 'Username', 
                    labeltext: 'Username', 
                    obscureText: false, 
                    controller: usernamecontroller, 
                    prefixIcon: const Icon(Icons.person_2_outlined),
                    suffixIcon: null),
          
                    const SizedBox(height: 20,),
          
                    MyTextField(
                      hintText: 'Email', 
                      labeltext: "Email", 
                      obscureText: false, 
                      controller: emailcontroller, 
                      prefixIcon: const Icon(Icons.email_outlined),
                      suffixIcon: null),
          
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
                          ),) ,     
              
                const SizedBox(height: 20),
          
                MyTextField(
                  hintText: 'Confirm Password', 
                  labeltext: 'Confirm Password', 
                  obscureText: _isHidden, 
                  controller: confirmPWcontroller, 
                  prefixIcon: const Icon(Icons.password),
                  suffixIcon: InkWell( 
                            onTap: _togglePasswordView,
                            child: Icon(
                              _isHidden
                              ? Icons.visibility
                              : Icons.visibility_off)
                          ),),
          
                  const SizedBox(height: 20,),
              
              MyButton(text: 'Proceed', onTap: signup),

              const SizedBox(height: 20,),
          
             
             Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                               Text('Already have an account?', style: TextStyle(color: Theme.of(context).colorScheme.primary,),),
                              const SizedBox(width: 10,),
                               GestureDetector( 
                                onTap: widget.onTap,
          
                                child: Text('Login', 
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.bold),))
                            ],
                          ),
              
              
              
                ],),
            
            ),
            ),
            ],),
        ),
      ),
      
    );
  }
}