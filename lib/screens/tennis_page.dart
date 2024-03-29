import 'package:flutter/material.dart';

class TennisPage extends StatefulWidget {
  const TennisPage({super.key});

  @override
  State<TennisPage> createState() => _TennisPageState();
}

class _TennisPageState extends State<TennisPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: AppBar(
        title: const Text("Tennis", style: TextStyle(color: Color(0xff97FB57), fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor:const Color(0xff121212),
       iconTheme: const IconThemeData(color: Color(0xff97FB57)),
       ),
        backgroundColor: const Color(0xff121212),
    );
  }
}