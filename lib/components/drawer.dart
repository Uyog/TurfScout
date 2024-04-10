import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class MyDrawer extends StatelessWidget {
  MyDrawer({super.key});

  final User? currentUser = FirebaseAuth.instance.currentUser;

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async {
    return await FirebaseFirestore.instance
        .collection("Users")
        .doc(currentUser!.email)
        .get();
  }

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
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/account_page');
                },
                child: DrawerHeader(
                  child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                      future: getUserDetails(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.hasError) {
                          return Text("Error: ${snapshot.error}");
                        } else if (snapshot.hasData) {
                          Map<String, dynamic>? user = snapshot.data!.data();
                
                          return Center(
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 25,
                                ),
                                Row(children: [
                                  Icon(
                                    Icons.person,
                                    size: 50,
                                    color: Theme.of(context).colorScheme.primary,
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Column(children: [
                                    Text(
                                      user!['username'],
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      user['email'],
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          fontSize: 15),
                                    ),
                                  ])
                                ])
                              ],
                            ),
                          );
                        } else {
                          return const Text("No data");
                        }
                      }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: const Icon(Icons.person_rounded),
                  title: Text(
                    "Profile",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  iconColor: Theme.of(context).colorScheme.primary,
                  onTap: () {
                    Navigator.pop(context);

                    Navigator.pushNamed(context, '/account_page');
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                    leading: const Icon(Icons.settings),
                    title: Text(
                      "Settings",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    iconColor: Theme.of(context).colorScheme.primary,
                    onTap: () {
                      Navigator.pop(context);

                      Navigator.pushNamed(context, '/account_page');
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                    leading: const Icon(Icons.home),
                    title: Text(
                      "Home",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    iconColor: Theme.of(context).colorScheme.primary,
                    onTap: () {
                      Navigator.pop(context);
                    }),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 25.0),
            child: ListTile(
              leading: const Icon(Icons.logout),
              title: Text(
                "Log Out",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
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
