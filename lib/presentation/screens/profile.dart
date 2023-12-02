import 'package:commerce_app/presentation/Component/profile_setting_listTile.dart';
import 'package:flutter/material.dart';

import 'Layout.dart';
import 'LogIn.dart';
import 'ProductHome.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back_outlined),onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (builder)=> HomePage()));
        },),

        title: const Text('Profile Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          // User info section
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.grey[200],
            child: const Row(
              children: [

                CircleAvatar(
                  radius: 40.0,
                  backgroundImage: NetworkImage(
                      'https://www.nicepng.com/png/detail/933-9332131_profile-picture-default-png.png',
                      scale: 0.1),
                ),
                SizedBox(width: 16.0),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ali',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'ali@test.com',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Section title
                const Text(
                  'My Orders',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                // List of orders
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: Image.asset(
                            'assets/images/potato.png'),
                        title: const Text('Potato'),
                        subtitle: const Text(
                            'Order ID: #123456\nDate: 01/08/2023'),
                        trailing: const Text('\$20.99'),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          // User settings section
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),

                Card(
                  child: Column(
                    children: [
                      SettingListTile(icon: Icon(Icons.edit), text: "Edit Profile", onTap: (){}),
                     SettingListTile(icon: Icon(Icons.lock), text: "Change Password", onTap: (){}),
                     SettingListTile(icon:  Icon(Icons.exit_to_app), text: 'Logout', onTap: (){
                       Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (builder)=>LoginPage()),(Route)=>false);
                     })

                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
