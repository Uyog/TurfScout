import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:turf_scout/components/drawer.dart';
import 'package:turf_scout/screens/account_page.dart';




class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,

        //AppBar
        appBar: AppBar(
          title: Text(
            "TurfScout",
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) =>  AccountPage(),
                      ));
                },
                icon: const Icon(Icons.account_circle_outlined))
          ],
          centerTitle: true,
          backgroundColor:Theme.of(context).colorScheme.background,
          iconTheme:  IconThemeData(color: Theme.of(context).colorScheme.primary),
        ),
        drawer: MyDrawer(),

        //body of the application
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                //Welcome to TurfScout
                Stack(
                  children: [
                    Image.asset('assets/images/football1.jpg'),
                    const Positioned(
                      top: 0,
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Text(
                          'Welcome to TurfScout!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffFFFFFF),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                //Space
                const SizedBox(
                  height: 20,
                ),

                //Categories
                 Text(
                  "Categories",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,),
                ),

                //Space
                const SizedBox(
                  height: 15,
                ),

                //Carousel
                CarouselSlider(
                  options: CarouselOptions(
                    aspectRatio: 16 / 9,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                  ),
                  items: [
                    SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: Card(
                        color:Theme.of(context).colorScheme.background,
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Stack(
                            children: [
                              Positioned(
                                child: Center(
                                    child: Image.asset(
                                  'assets/images/pngegg (1).png',
                                  color: Theme.of(context).colorScheme.primary,
                                )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: Card(
                        color: Theme.of(context).colorScheme.background,
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Stack(
                            children: [
                              Positioned(
                                child: Center(
                                    child: Image.asset(
                                  'assets/images/pngegg (2).png',
                                  color: Theme.of(context).colorScheme.primary,
                                )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: Card(
                        color: Theme.of(context).colorScheme.background,
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Stack(
                            children: [
                              Positioned(
                                child: Center(
                                  child: Image.asset(
                                    'assets/images/pngegg (4).png',
                                    color: Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              ),
                            ],
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
