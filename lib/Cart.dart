import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Layout.dart';
import 'ProductHome.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final List<Map<String, dynamic>> products = [
    {
      'name': 'cheese',
      'price': 2.2,
      'image': 'assets/images/cheese.png',
      'quantity': 1,
    },
    {
      'name': 'milk',
      'price': 17,
      'image': 'assets/images/milk.png',
      'quantity': 2,
    },
    {
      'name': 'pizza',
      'price': 3.99,
      'image': 'assets/images/petza_1.png',
      'quantity': 3,
    },
  ];

  double getTotalPrice() {
    double total = 0.0;
    for (var product in products) {
      total += product['price'] * product['quantity'];
    }
    return total;
  }

  void removeProduct(int index) {
    setState(() {
      products.removeAt(index);
    });
  }

  void incrementQuantity(int index) {
    setState(() {
      products[index]['quantity']++;
    });
  }

  void _decrementQuantity(int index) {
    setState(() {
      if (products[index]['quantity'] > 1) {
        products[index]['quantity']--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'), // App title
        centerTitle: true, // Center the title
        backgroundColor: Colors.white60, // Appbar background color
        elevation: 0.0, // Appbar elevation
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Back icon
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const HomePage()));
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Image.asset(products[index]['image']), //
                    title: Text(products[index]['name']),
                    subtitle: Text('\$${products[index]['price']}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () {
                            _decrementQuantity(index);
                          },
                        ),
                        Text('${products[index]['quantity']}'),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            incrementQuantity(index);
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            removeProduct(index);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total: \$${getTotalPrice().toStringAsFixed(2)}',
                  style: const TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  child: const Text('Checkout'),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content:
                          Text('Payment processed successfully! Thank you!'),
                      duration: Duration(seconds: 2),
                    ));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
