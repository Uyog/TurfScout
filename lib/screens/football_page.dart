import 'package:flutter/material.dart';

class FootballPage extends StatefulWidget {
  const FootballPage({super.key});

  @override
  State<FootballPage> createState() => _FootballPageState();
}

class _FootballPageState extends State<FootballPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: const Text("Football", style: TextStyle(color: Color(0xff97FB57), fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor:const Color(0xff121212),
       iconTheme: const IconThemeData(color: Color(0xff97FB57)),
       ),
        backgroundColor: const Color(0xff121212),
    );
  }
}