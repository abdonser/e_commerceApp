import 'package:commerce_app/presentation/Component/dept_card.dart';
import 'package:flutter/material.dart';
import 'Layout.dart';

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
          leading: IconButton(icon: Icon(Icons.arrow_back_outlined),onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (builder)=> HomePage()));
          },),
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



            DeptCard(image: 'assets/images/petza_1.png', text: "pizza section"),
            DeptCard(image: 'assets/images/veg_1.png', text: "vegtables Section"),
            DeptCard(image: 'assets/images/porger.png', text: "porger Section"),
            DeptCard(image: 'assets/images/0.png', text: "Oil Section"),
            DeptCard(image: 'assets/images/cheese.png', text: "cheese Section"),
            DeptCard(image: 'assets/images/wafil.png', text: "wafil Section"),
            DeptCard(image: 'assets/images/milk.png', text: "milk Section"),
            DeptCard(image: 'assets/images/porger.png', text: "porger Section"),
            DeptCard(image: 'assets/images/porger.png', text: "porger Section"),




            
          ],
        ));
  }
}
