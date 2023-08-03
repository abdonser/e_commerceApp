import 'package:flutter/material.dart';

class Departs extends StatelessWidget {
  Departs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:  const Row(
            children: [
              Text(
                "Cate",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: AutofillHints.addressCity),
              ),
              Text(
                "gory",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                    color: Colors.green),
              )
            ],
          ),
          centerTitle: true,
          actions: [
            // Shopping cart icon
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                // Navigate to shopping cart page
              },
            ),
          ],
        ),
        body: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
            crossAxisSpacing: 3 / 2,
            mainAxisSpacing: 20,
          ),
          children: [
            Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Category image
                  Image.asset(
                    'assets/images/veg_1.png',
                    height: 140,
                  ),
                  SizedBox(height: 8.0),
                  // Category name
                  Text("vegtables Section"),
                ],
              ),
            ),
            Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Category image
                  Image.asset(
                    'assets/images/petza_1.png',
                    height: 140,
                  ),
                  SizedBox(height: 8.0),
                  // Category name
                  Text("pizza Section"),
                ],
              ),
            ),
            Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Category image
                  Image.asset(
                    'assets/images/potato.png',
                    height: 140,
                  ),
                  SizedBox(height: 8.0),
                  // Category name
                  Text("fast food Section"),
                ],
              ),
            ),
            Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Category image
                  Image.asset(
                    'assets/images/porger.png',
                    height: 140,
                  ),
                  SizedBox(height: 8.0),
                  // Category name
                  Text("porger Section"),
                ],
              ),
            ),
            Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Category image
                  Image.asset(
                    'assets/images/0.png',
                    width: 180,
                    height: 150,
                  ),
                  SizedBox(height: 8.0),
                  // Category name
                  Text("Oil Section"),
                ],
              ),
            ),
            Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Category image
                  Image.asset(
                    'assets/images/cheese.png',
                    height: 140,
                  ),
                  SizedBox(height: 25.0),
                  // Category name
                  const Padding(
                    padding: EdgeInsets.only(
                      bottom: 1,
                    ),
                    child: Text("cheese Section"),
                  ),
                ],
              ),
            ),
            Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Category image
                  Image.asset(
                    'assets/images/wafil.png',
                    height: 140,
                  ),
                  SizedBox(height: 8.0),
                  // Category name
                  Text("wafil Section"),
                ],
              ),
            ),
            Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Category image
                  Image.asset('assets/images/milk.png', height: 140),
                  SizedBox(height: 8.0),
                  // Category name
                  Text("milk Section"),
                ],
              ),
            ),
          ],
        ));
  }
}
