import 'package:commerce_app/presentation/screens/profile.dart';
import 'package:flutter/material.dart';

import 'ProductHome.dart';
import 'departs.dart';

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
        currentIndex: currentIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white60,
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
