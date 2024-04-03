import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
 final String text;
  final void Function ()? onTap;
  const MyButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(10.0),
        decoration:  BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Theme.of(context).colorScheme.primary,),
      child: Text(
        textAlign: TextAlign.center,
        text,
        style:  TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.background,),
      ),
        ),
      );
    
  }
}