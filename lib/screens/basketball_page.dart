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
          title: Text(
            "Basketball",
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.background,
          iconTheme:
              IconThemeData(color: Theme.of(context).colorScheme.primary),
        ),

        backgroundColor: Theme.of(context).colorScheme.background,
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Card(
  
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20),
  ),
  clipBehavior: Clip.antiAliasWithSaveLayer,
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Add an image widget to display an image
            Image.asset(
              'assets/images/pngegg (9).png', 
              color: Theme.of(context).colorScheme.primary,
              height: 150,
              width: 150,
              
            ),
            Container(width: 1),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(height: 5),
                  Center( 
                    child: Text( 
                      "What would you like?",
                      style: TextStyle(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold, fontSize: 31)
                    ),
                  ),
                  

                
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  ),
),
                 
                ],
              ),
            ))
       );
  }
}