import 'package:flutter/material.dart';
import 'package:turf_scout/screens/home_page.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xff264027),
      body: Column( 
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
          padding: const EdgeInsets.all(100),
        child: Center(
          child: Column(
            children: [
              const Text('Forgot Password?',textAlign: TextAlign.center, style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500, color: Color(0xffFFFFFF)),),

              const SizedBox(height: 30,),

               const TextField(decoration: InputDecoration(
                hintText: 'Email',
                hintStyle: TextStyle(color: Color(0xffFFFFFF)),
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email, color: Color(0xffFFFFFF),),
                label: Text('Email')
                ),
                ),

                const SizedBox(height: 20,),

                RichText(
                      text:  const TextSpan(                            
                        children:  <TextSpan>[
                         TextSpan(text: 'or',),
                         ]
                         )
                         ),

                         const SizedBox(height: 20,),

                         const TextField(decoration: InputDecoration(
                hintText: 'Phone Number',
                hintStyle: TextStyle(color: Color(0xffFFFFFF)),
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.phone_android, color: Color(0xffFFFFFF),),
                label: Text('Phone Number')
                ),
                ),

                const SizedBox(height: 20,),

                 RichText(
                      text:  const TextSpan(                            
                        children:  <TextSpan>[
                         TextSpan(text: 'Enter code sent to your email/ phone',),
                         ]
                         )
                         ),

                const SizedBox(height: 20,),

              const TextField(decoration: InputDecoration(
                hintText: 'Enter code',
                hintStyle: TextStyle(color: Color(0xffFFFFFF)),
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.code, color: Color(0xffFFFFFF),),
                label: Text('code')
                ),
              ),

               const SizedBox(height: 20,),

                 ElevatedButton(onPressed: (){
                    
                    Navigator.pushReplacement(
                      context, 
                      MaterialPageRoute<void>(
                      builder: (BuildContext context) => const HomePage(),
                      ));
                  }, 
                  
                  child: const Text("Proceed", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),),
              



        ],),
        ),
        )

      ],),
    );
  }
}