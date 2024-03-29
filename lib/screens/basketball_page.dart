import 'package:flutter/material.dart';

class BasketballPage extends StatefulWidget {
  const BasketballPage({super.key});

  @override
  State<BasketballPage> createState() => _BasketballPageState();
}

class _BasketballPageState extends State<BasketballPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        title: const Text("Basketball", style: TextStyle(color: Color(0xff97FB57), fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor:const Color(0xff121212),
       iconTheme: const IconThemeData(color: Color(0xff97FB57)),
       ),
        backgroundColor: const Color(0xff121212),
        body: const Text("Welcome! Would you like to...", style: TextStyle(color: Color(0xff97FB57)),),
       );
  }
}