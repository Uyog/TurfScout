import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turf_scout/components/my_back_button.dart';
import 'package:turf_scout/provider/provider.dart';

class AccountPage extends StatelessWidget {
  AccountPage({super.key});

  final User? currentUser = FirebaseAuth.instance.currentUser;

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async {
    return await FirebaseFirestore.instance
        .collection("Users")
        .doc(currentUser!.email)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
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
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 50.0,
                        left: 25.0,
                      ),
                      child: Row(
                        children: [
                          MyBackButton(),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(25)),
                      padding: const EdgeInsets.all(25.0),
                      child: Icon(
                        Icons.person,
                        size: 65,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      user!['username'],
                      style: TextStyle(
                          fontSize: 24,
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      user['email'],
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    Consumer<UiProvider>(
                        builder: (context, UiProvider notifier, child) {
                      return Column(
                        children: [
                          ListTile(
                            leading: const Icon(Icons.lightbulb_rounded),
                            iconColor: Theme.of(context).colorScheme.primary,
                            title: Text(
                              "Theme",
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary),
                            ),
                            trailing: Switch(
                                value: notifier.isDark,
                                onChanged: (value) => notifier.changeTheme()),
                          ),
                        ],
                      );
                    })
                  ],
                ),
              );
            } else {
              return const Text("No data");
            }
          }),
    );
  }
}
