
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [ 
          Column(
            children: [
              DrawerHeader(
                child: Icon(Icons.home,
                color: Theme.of(context).colorScheme.primary,)
                ),
              
                
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: const Icon(Icons.account_circle_outlined),
                  title:  Text(
                    "Account",
                    style: TextStyle(color: Theme.of(context).colorScheme.primary,),
                  ),
                  iconColor: Theme.of(context).colorScheme.primary,
                  onTap: ()  {
                Navigator.pop(context);

                Navigator.pushNamed(context, '/account_page');
                  },
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: const Icon(Icons.calendar_month_sharp),
                  title:  Text(
                    "Events Calendar",
                    style: TextStyle(color:Theme.of(context).colorScheme.primary,),
                  ),
                  iconColor: Theme.of(context).colorScheme.primary,
                  onTap: () {
                  Navigator.pop(context);

                    Navigator.pushNamed(context, '/events_calendar');
                  },
                ),
              ),
              
              
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: const Icon(Icons.shopping_cart_outlined),
                  title:  Text(
                    "Shop",
                    style: TextStyle(color:Theme.of(context).colorScheme.primary,),
                  ),
                  iconColor: Theme.of(context).colorScheme.primary,
                  onTap: ()  {
                   Navigator.pop(context);

                    Navigator.pushNamed(context, '/shop');
                  },
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: const Icon(Icons.settings),
                  title:  Text(
                    "Settings",
                    style: TextStyle(color: Theme.of(context).colorScheme.primary,),
                  ),
                  iconColor: Theme.of(context).colorScheme.primary,
                  onTap: () {
                    Navigator.pop(context);

                     Navigator.pushNamed(context, '/settings');
                  }
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 25.0),
            child: ListTile(
              leading: const Icon(Icons.logout),
              title:  Text(
                "Log Out",
                style: TextStyle(color: Theme.of(context).colorScheme.primary,),
              ),
              iconColor: Theme.of(context).colorScheme.primary,
              onTap: logout,
            ),
          ),
        ],
      ),
    );
  }
}
