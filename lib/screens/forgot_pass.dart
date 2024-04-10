import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:turf_scout/components/text_field.dart';


class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  final emailcontroller = TextEditingController();

  @override
  void dispose(){
    emailcontroller.dispose();
    super.dispose();
  }

  Future passwordReset()async{
   try{
     await FirebaseAuth.instance
    .sendPasswordResetEmail(email: emailcontroller.text.trim());
     showDialog(context: context, 
    builder: (context){
      return const AlertDialog(
        content: Text('Password Rest Link Sent. Check Your Email') ,
      );
    });
   } on FirebaseAuthException catch (e) {
    print(e);
    showDialog(context: context, 
    builder: (context){
      return AlertDialog(
        content: Text(e.message.toString()) ,
      );
    });
   }
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     appBar: AppBar(
          backgroundColor:Theme.of(context).colorScheme.background,
          iconTheme:  IconThemeData(color: Theme.of(context).colorScheme.primary),
          elevation: 0,
        ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         
         const Padding(
            padding:  EdgeInsets.all(25.0),
            child:  Text("Enter your Email and we will send you a password reset link", 
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),),
          ),

            Padding(
              padding: const EdgeInsets.all(25.0),
              child: MyTextField(
                        hintText: "Email", 
                        labeltext: 'Email', 
                        obscureText: false, 
                        controller: emailcontroller, 
                        prefixIcon: const Icon(Icons.email),
                        suffixIcon: null
                        
                        ),
            ),
            MaterialButton(onPressed: passwordReset,
            color: Theme.of(context).colorScheme.primary,
            child: Text("Reset Password", style: TextStyle(color: Theme.of(context).colorScheme.background),),
            )
        ],
      ),
        

    );
  }
}