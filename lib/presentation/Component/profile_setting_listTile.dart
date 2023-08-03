import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingListTile extends StatelessWidget {
  Icon icon;
  String text;
  Function() onTap;
   SettingListTile({super.key,required this.icon,required this.text,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      leading:icon,
      title:  Text(text),
      onTap: onTap,
    );
  }
}
