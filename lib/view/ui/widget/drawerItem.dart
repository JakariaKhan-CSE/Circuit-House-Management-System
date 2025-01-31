import 'package:flutter/material.dart';

class drawerItem extends StatelessWidget {
  final String icon;
  final String text;
  final VoidCallback onTap;
  const drawerItem({
    super.key, required this.text, required this.onTap, required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.only(left: 15,right: 5),
        leading: Image.asset(icon,height: 25,width: 25,fit: BoxFit.cover,),
        title:  Text(text,style: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 18
        ),),
        onTap: onTap,
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}