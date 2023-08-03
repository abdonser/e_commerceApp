import 'package:flutter/material.dart';

class AboutDeleloper extends StatelessWidget {
  const AboutDeleloper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("about developer"),
        centerTitle: true,
        backgroundColor: Colors.grey[100],
      ),
      body: Container(
        padding: EdgeInsetsDirectional.only(top: 50),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        height: 300,
        child: Card(
          child: ListTile(
            leading: Image.network(
                'https://lh3.googleusercontent.com/a/AAcHTtfZlGqZaVTBBUbMMtPOysOog6hW5rkIGkSNH4eqKg40EQ=s360-c-no'),
            title: const Text('Name:Abdelhameed Nser Mohamed'),
            subtitle: const Text(
                'Phone Number:01030599371\nEducation:FCIS\nDept:it\nJop:flutter developer\nEmail:abdelhamidnser@gmail.com\nProject Name:E-commerce App '),
            trailing: const Text(''),
          ),
        ),
      ),
    );
  }
}
