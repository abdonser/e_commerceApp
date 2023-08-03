import 'package:commerce_app/departs.dart';

import 'package:commerce_app/profile.dart';
import 'package:flutter/material.dart';
import 'ProductHome.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  List<Widget> screens = [
    ProductGrid(),
    //  Categories(),
     Departs(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.blueGrey,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white60,
        currentIndex: 0,
        onTap: (index) {
          print(index);
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          BottomNavigationBarItem(icon: Icon(Icons.pages), label: "departs"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: "profile"),
        ],
      ),
    );
  }
}
