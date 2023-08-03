import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ProductDetailScreen extends StatefulWidget {

   ProductDetailScreen({super.key,});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
final productdetail=FirebaseFirestore.instance.collection("ProductBase").snapshots();

  get index => null;
@override
  void setState(VoidCallback fn) {

  // TODO: implement setState
    super.setState(fn);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       // title: Text('${product?.name}'),
      ),
      body:StreamBuilder(
        stream: productdetail,
        builder: (BuildContext context,AsyncSnapshot<dynamic> snapshot){
          if (snapshot.hasError){
            return const Text("connectiot error");
          }
          if (snapshot.connectionState==ConnectionState.waiting){
            return const Text("loading");
          }
          var docs=snapshot.data!.docs;
          return  Card(
            child: Column(children: [
              Image.network("${docs[1]['imageUrl']}"),
              Text("${docs[1]['name']}"),
              Text('${docs[1]['price']}'),
              Text('${docs[1]['description']}'),





            ],),



          );





        }




      )
    );
  }
}