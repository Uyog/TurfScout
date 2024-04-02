import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:turf_scout/components/button.dart';
import 'package:turf_scout/components/text_field.dart';
import 'package:turf_scout/helper/helper_functions.dart';
import 'package:turf_scout/screens/home_page.dart';
import 'package:turf_scout/screens/login.dart';

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


  void signup() async {
    showDialog(
    context: context, 
    builder: (context) => const Center(
      child: CircularProgressIndicator(),
    ));

    if (passwordcontroller.text != confirmPWcontroller.text) {
      Navigator.pop(context);
      displayMessageToUser("Wrong Password", context);
    } else{
      try {
        UserCredential? userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailcontroller.text, password: passwordcontroller.text);

         

          if(context.mounted) Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context);

        displayMessageToUser(e.code, context);
      }
    }
  }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
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
                  const Text("Sign Up ",  textAlign: TextAlign.center, style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600, color: Color(0xff000000)),),
          
                  const SizedBox(height: 20,),
          
                  MyTextField(
                    hintText: 'Username', 
                    labeltext: 'Username', 
                    obscureText: false, 
                    controller: usernamecontroller, 
                    prefixIcon: const Icon(Icons.person_2_outlined)),
          
                    const SizedBox(height: 20,),
          
                    MyTextField(
                      hintText: 'Email', 
                      labeltext: "Email", 
                      obscureText: false, 
                      controller: emailcontroller, 
                      prefixIcon: const Icon(Icons.email_outlined)),
          
                     const SizedBox(height: 20,),   
          
                     MyTextField(
                      hintText: 'Password', 
                      labeltext: "Password", 
                      obscureText: true, 
                      controller: passwordcontroller, 
                      prefixIcon: const Icon(Icons.password)) ,     
              
                const SizedBox(height: 20),
          
                MyTextField(
                  hintText: 'Confirm Password', 
                  labeltext: 'Confirm Password', 
                  obscureText: true, 
                  controller: confirmPWcontroller, 
                  prefixIcon: const Icon(Icons.password)),
          
                  const SizedBox(height: 20,),
              
              MyButton(text: 'Proceed', onTap: signup),
          
             
             Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Already have an account?', style: TextStyle(color: Color(0xff97FB57),),),
                              const SizedBox(width: 10,),
                               GestureDetector( 
                                onTap: widget.onTap,
          
                                child: const Text('Login', 
                                style: TextStyle(
                                  color: Color(0xff97FB57), 
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