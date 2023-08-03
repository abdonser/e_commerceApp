import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:commerce_app/presentation/screens/profile.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Cart.dart';
import '../../Domain/model/product.dart';

import 'LogIn.dart';
import 'ProductDetail.dart';
import 'aboutDeleloper.dart';


class ProductGrid extends StatefulWidget {
  @override
  State<ProductGrid> createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {
  Product? product;


  final productModel =
      FirebaseFirestore.instance.collection("ProductBase").snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:  PopupMenuButton(

            icon: const Icon (Icons.menu),
            itemBuilder: (context){
              return [
                const PopupMenuItem<int>(
                  value: 0,
                  child: Text(" Cart"),
                ),
                const PopupMenuItem<int>(
                  value: 1,
                  child: Text("Profile"),

                ),
                PopupMenuItem<int>(
                  value: 2,
                  child: Text("Logout"),
                ),
                const PopupMenuItem<int>(
                  value: 3,
                  child: Text("About developer"),
                ),
              ];
            },
            onSelected:(value){
              if(value == 0){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage()));

              }else if(value == 1){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage()));

              }else if(value == 2){
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginPage()),(Route)=>false);
              }else if(value == 3){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutDeleloper()));
              }
            }
        ),
        backgroundColor: Colors.white70,
        actions: [
          const Row(
            children: [
              Text(
                "BUY",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.black87),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "AnyTHING.",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              )
            ],
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage()));

            },
          )
        ],
      ),
      body: StreamBuilder(
        stream: productModel,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            return Text("connectionErorr");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Text("LOADING..."));
          }
          var docs = snapshot.data!.docs;
          return GridView.builder(
            itemCount: 10,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductDetailScreen()));

                },
                child: Card(
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.network("${docs[index]['imageUrl']},",scale: 0.1,)
                      ),
                      Text("${docs[index]['name']}"),
                      Text('${docs[index]['price']}'),
                      FloatingActionButton(
                        onPressed: () {


                        },
                        child: const Icon(
                          Icons.add,
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
