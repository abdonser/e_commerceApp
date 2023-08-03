import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:commerce_app/Domain/model/product.dart';


class ApiProvider {
  Product? product;


  Future<Product?> readProduct() async {
    await FirebaseFirestore.instance
        .collection("ProductBase")
        .doc("p2")
        .get()
        .then((value) {
      product = Product.fromJson(value.data()!);
      print(product?.name);
      print(value.data());
      print(product?.price);
    });
    return product;
  }


}

