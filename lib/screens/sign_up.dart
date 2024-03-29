import 'package:flutter/material.dart';
import 'package:turf_scout/screens/home_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: Column( 
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Padding(
          padding: const EdgeInsets.all(50.0),
           
        
      
        child: Center(       
          child: Column(
            children: [ 
              const Text("Sign Up ",  textAlign: TextAlign.center, style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600, color: Color(0xff000000)),),

              const SizedBox(height: 20,),
          
          const TextField(decoration: InputDecoration( 
            hintText: "First Name", 
            hintStyle: TextStyle(color: Color(0xff000000)),
            border:OutlineInputBorder(),
            label: Text("First Name"),
            prefixIcon: Icon(Icons.person, color: Color(0xff000000),)
            
            
            ),),
          
            const SizedBox(height: 20),
          
            const TextField(decoration: InputDecoration( 
            hintText: "Last Name", 
            hintStyle: TextStyle(color: Color(0xff000000)),
            border: OutlineInputBorder(),
            label: Text("Last Name"),
             prefixIcon: Icon(Icons.person, color: Color(0xff000000),)
            ),),

            const SizedBox(height: 20,),

            const TextField(decoration: InputDecoration( 
            hintText: "Phone Number", 
            hintStyle: TextStyle(color: Color(0xff000000)),
            border:OutlineInputBorder(),
            label: Text("Phone Number"),
            prefixIcon: Icon(Icons.phone_android, color: Color(0xff000000),)
            
            
            ),),
          
            const SizedBox(height: 20,),
          
            const TextField(decoration: InputDecoration( 
            hintText: "Email", 
            hintStyle: TextStyle(color: Color(0xff000000)),
            border: OutlineInputBorder(),
            label: Text("Email"),
            prefixIcon: Icon(Icons.email, color: Color(0xff000000),)
            ),),
          
            const SizedBox(height: 20,),
          
            const TextField(
              obscureText: true,
              decoration: InputDecoration( 
            hintText: "Password",
            hintStyle: TextStyle(color: Color(0xff000000)), 
            border: OutlineInputBorder(),
            label: Text("Password"),
            prefixIcon: Icon(Icons.password, color: Color(0xff000000),)
            ),),
          
            const SizedBox(height: 20),
          
           ElevatedButton(onPressed: (){
                      
                      Navigator.pushReplacement(
                        context, 
                        MaterialPageRoute<void>(
                        builder: (BuildContext context) => const HomePage()
                        ));
                    }, 
                    
                    child: const Text("Proceed", style: TextStyle(color: Colors.black),),),
          
          
          
            ],),
        
  ),
  ),
  ],),
      
    );
  }
}