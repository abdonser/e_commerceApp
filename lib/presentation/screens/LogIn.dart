import 'package:commerce_app/presentation/Component/costom_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Layout.dart';
import 'Regester.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailcontroller = TextEditingController();

  TextEditingController passwordcontroller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String _email = '';

  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white30,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           CostomText(title: "BUY", color: Colors.black),
            SizedBox(
              width: 5,
            ),
           CostomText(title: "AnyTHING", color:Colors.green)
          ],
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Container(
            height: 500,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Form(
              key: _formKey,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Hi,Welcome back",
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: emailcontroller,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          setState(() {
                            _email = value!;
                          });
                        },
                        onFieldSubmitted: (value) {
                          print(value);
                        },
                        decoration: const InputDecoration(
                          labelText: "Email",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.email),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        controller: passwordcontroller,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          setState(() {
                            _password = value!;
                          });
                        },
                        obscureText: true,
                        onFieldSubmitted: (value) {
                          print(value);
                        },
                        decoration: const InputDecoration(
                          labelText: "password",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock_outline),
                          suffixIcon: Icon(Icons.remove_red_eye),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Container(
                        width: double.infinity,
                        color: Colors.greenAccent,
                        child: MaterialButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                      email: emailcontroller.text,
                                      password: passwordcontroller.text)
                                  .then((value) => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomePage())));

                              // FirebaseAuth.instance.createUserWithEmailAndPassword(
                              //   email: emailcontroller.text,
                              //   password: passwordcontroller.text);
                            }

                          },
                          child: const Text(
                            "login",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          const Text(
                            "Do not have un account",
                            style: TextStyle(fontSize: 20),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => RegesterPage()));
                              },
                              child: const Text(
                                " Regester Now",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: double.infinity,
                        color: Colors.grey,
                        child: MaterialButton(
                          onPressed: () {},
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.g_mobiledata_outlined),
                              Text(
                                "sign in with google",
                                style:
                                    TextStyle(fontSize: 20, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
