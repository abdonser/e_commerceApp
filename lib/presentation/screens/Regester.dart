//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Component/costom_text.dart';
import 'Layout.dart';
import 'LogIn.dart';



class RegesterPage extends StatefulWidget {
  RegesterPage({super.key});

  @override
  State<RegesterPage> createState() => _RegesterPageState();
}

class _RegesterPageState extends State<RegesterPage> {
  TextEditingController emailcontroller = TextEditingController();

  TextEditingController passwordcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String _name = '';

  String _email = '';

  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(


        backgroundColor: Colors.white30,
        title:
          Row(
            children: [
              CostomText(title: "BUY", color: Colors.black),
              SizedBox(
                width: 5,
              ),
              CostomText(title: "AnyTHING", color:Colors.green)
            ],
          )
        ,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Container(
            height: 600,
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
                        height: 20,
                      ),
                      TextFormField(
                          onFieldSubmitted: (value) {
                            print(value);
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            setState(() {
                              _name = value!;
                            });
                          },
                          decoration: const InputDecoration(
                            labelText: "User Name",
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.person),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: emailcontroller,
                        keyboardType: TextInputType.emailAddress,
                        onFieldSubmitted: (value) {
                          print(value);
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Email';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          setState(() {
                            _email = value!;
                          });
                        },
                        decoration: const InputDecoration(
                          labelText: "Email",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.email),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: passwordcontroller,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your passward';
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
                          suffixIcon: Icon(Icons.remove_red_eye_rounded),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        color: Colors.greenAccent,
                        child: MaterialButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                      email: emailcontroller.text,
                                      password: passwordcontroller.text)
                                  .then((value) => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const HomePage())));
                            }
                            else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(
                                    'please enter the user name and password'),
                                duration: Duration(seconds: 5),
                              ));
                            }
                          },
                          child: const Text(
                            "Regester",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          const Text(
                            "have un account",
                            style: TextStyle(fontSize: 20),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()));
                              },
                              child: const Text(
                                " login",
                                style: TextStyle(color: Colors.blue, fontSize: 20),
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
                              Icon(Icons.g_mobiledata),
                              Text(
                                "sign in with google",
                                style: TextStyle(fontSize: 20, color: Colors.white),
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
