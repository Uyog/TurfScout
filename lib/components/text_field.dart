import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final String labeltext;
  final bool obscureText;
  final TextEditingController controller;
  final Widget prefixIcon;

  const MyTextField({super.key,

  required this.hintText,
  required this.labeltext,
  required this.obscureText,
  required this.controller,
  required this.prefixIcon,

  });

  @override
  Widget build(BuildContext context) {
    return TextField( 
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
        icon: prefixIcon,
        border: OutlineInputBorder( 
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: hintText,
        labelText: labeltext,
        iconColor: Theme.of(context).colorScheme.primary,
        
      ),
      
    );
  }
}