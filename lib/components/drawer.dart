import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:turf_scout/screens/account_page.dart';
import 'package:turf_scout/screens/events_calendar.dart';
import 'package:turf_scout/screens/settings.dart';
import 'package:turf_scout/screens/shop.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shadowColor: const Color(0xff97FB57),
      backgroundColor: const Color(0xff121212),
      child: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ListTile(
                leading: const Icon(Icons.account_circle_outlined),
                title: const Text(
                  "Account",
                  style: TextStyle(color: Color(0xff97FB57)),
                ),
                iconColor: const Color(0xff97FB57),
                onTap: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const AccountPage(),
                      ))
                },
              ),
              ListTile(
                leading: const Icon(Icons.calendar_month_sharp),
                title: const Text(
                  "Events Calendar",
                  style: TextStyle(color: Color(0xff97FB57)),
                ),
                iconColor: const Color(0xff97FB57),
                onTap: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const EventsCalendar(),
                      ))
                },
              ),
              ListTile(
                leading: const Icon(Icons.shopping_cart_outlined),
                title: const Text(
                  "Shop",
                  style: TextStyle(color: Color(0xff97FB57)),
                ),
                iconColor: const Color(0xff97FB57),
                onTap: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const ShopPage(),
                      ))
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text(
                  "Settings",
                  style: TextStyle(color: Color(0xff97FB57)),
                ),
                iconColor: const Color(0xff97FB57),
                onTap: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const SettingsPage(),
                      ))
                },
              ),
            ],
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text(
              "Log Out",
              style: TextStyle(color: Color(0xff97FB57)),
            ),
            iconColor: const Color(0xff97FB57),
            onTap: logout,
          ),
        ],
      ),
    );
  }
}
