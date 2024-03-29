import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:turf_scout/screens/account_page.dart';
import 'package:turf_scout/screens/basketball_page.dart';
import 'package:turf_scout/screens/events_calendar.dart';
import 'package:turf_scout/screens/football_page.dart';
import 'package:turf_scout/screens/settings.dart';
import 'package:turf_scout/screens/shop.dart';
import 'package:turf_scout/screens/tennis_page.dart';


class HomePage extends StatelessWidget{
  const HomePage({super.key});

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: const Color(0xff121212),
      
      drawer:  Drawer( shadowColor: const Color(0xff97FB57), 
        backgroundColor: const Color(0xff121212),
        child: ListView(
          children:  [
            ListTile(
              leading: const Icon(Icons.account_circle_outlined),
              title: const Text("Account", style: TextStyle(color: Color(0xff97FB57)),),
              iconColor: const Color(0xff97FB57),
              onTap: () => {
                Navigator.push(
                  context, 
                   MaterialPageRoute<void>(
                      builder: (BuildContext context) => const AccountPage(),)
             ) },
            ),
            ListTile(
              leading: const Icon(Icons.calendar_month_sharp),
              title: const Text("Events Calendar", style: TextStyle(color: Color(0xff97FB57)),),
              iconColor: const Color(0xff97FB57),
               onTap: () => {
                Navigator.push(
                  context, 
                   MaterialPageRoute<void>(
                      builder: (BuildContext context) => const EventsCalendar(),)
             ) },
            ),
             ListTile(
              leading: const Icon(Icons.shopping_cart_outlined),
              title: const Text("Shop", style: TextStyle(color: Color(0xff97FB57)),),
              iconColor: const Color(0xff97FB57),
               onTap: () => {
                Navigator.push(
                  context, 
                   MaterialPageRoute<void>(
                      builder: (BuildContext context) => const ShopPage(),)
             ) },
            ),
                ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Settings", style: TextStyle(color: Color(0xff97FB57)),),
              iconColor: const Color(0xff97FB57),
               onTap: () => {
                Navigator.push(
                  context, 
                   MaterialPageRoute<void>(
                      builder: (BuildContext context) => const SettingsPage(),)
             ) },
            ),],
        ),
       ),


      //AppBar
       appBar: AppBar(
        title: const Text("TurfScout", style: TextStyle(color: Color(0xff97FB57), fontWeight: FontWeight.bold),),
        actions: [
          IconButton(onPressed: (){
             Navigator.push(
                  context, 
                   MaterialPageRoute<void>(
                      builder: (BuildContext context) => const AccountPage(),)
             );
          }, icon: const Icon(Icons.account_circle_outlined))
        ],
        centerTitle: true,
        backgroundColor:const Color(0xff121212),
       iconTheme: const IconThemeData(color: Color(0xff97FB57)),
       ),
      
      //body of the application
       body: Padding( 
         padding: const EdgeInsets.all(10.0),
         child:  SingleChildScrollView( 
          scrollDirection: Axis.vertical,
          child: Column(
          children: [ 

            //Welcome to TurfScout
 Stack(
  children: [
    Image.asset('assets/images/football1.jpg'),
    const Positioned(
      top: 0, bottom: 0,left: 0,right: 0,
      child: Center(
        child: Text(
          'Welcome to TurfScout!',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Color(0xffFFFFFF),
          ),
        ),
      ),
    ),
  ],),

              //Space
            const SizedBox(height: 20,),

            //Categories
            const Text("Categories",  textAlign: TextAlign.end,style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xff909090)),),

            //Space
            const SizedBox(height: 15,),

            //Carousel
           CarouselSlider(
    options: CarouselOptions(
    aspectRatio: 16/9,
    autoPlay: true,
    enlargeCenterPage: true,
    enableInfiniteScroll: true,
  ),
  items: [ 
   Expanded(
  child: GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => const FootballPage(),
        ),
      );
    },
    child:  const SizedBox( width: double.infinity, height: double.infinity,
      child: Card(
        color: Color(0xff121212),
        elevation: 4,
        child: Padding(padding:  EdgeInsets.all(16),
          child: Stack(
          children: [
     Positioned(
      child: Center(
        child: Text(
          'Football',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold,color: Color(0xff97FB57),),),
      ),
    ),
  ],),
        ),
      ),
    ),
  ),
),


    Expanded(
  child: GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => const BasketballPage(),
        ),);},
    child:  const SizedBox( 
      width: double.infinity, 
      height: double.infinity,
      child:  Card(
        color: Color(0xff121212),
        elevation: 4,
        child: Padding(
          padding:  EdgeInsets.all(16),
          child:  Stack(
          children: [
     Positioned(
      child: Center(
        child: Text(
          'Basketball',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold,color: Color(0xff97FB57),),),
      ),
    ),
  ],),
        ),
      ),
    ),
  ),
),


   Expanded(
  child: GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => const TennisPage(),
        ),);},
    child:  const SizedBox(
      width: double.infinity, 
      height: double.infinity,
      child:  Card(
        color: Color(0xff121212),
        elevation: 4,
        child: Padding(
          padding:  EdgeInsets.all(16),
          child:  Stack(
          children: [
     Positioned(
      child: Center(
        child: Text(
          'Tennis',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold,color: Color(0xff97FB57),),),
      ),
    ),
  ],),
        ),
      ),
    ),
  ),
),
  ],
)

          ],
         ),
       ),
    ));
  }
}
