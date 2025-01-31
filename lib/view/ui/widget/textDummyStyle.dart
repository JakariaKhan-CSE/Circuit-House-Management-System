import 'package:flutter/material.dart';

class Textdummystyle extends StatelessWidget {
  final String btnTxt;
  const Textdummystyle({super.key, required this.btnTxt});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 200,
      decoration: const BoxDecoration(
          color: Color(0xFF287277)
      ),
      child: Center(
        child: Text(btnTxt,style: const TextStyle(
            color: Colors.white,
            fontSize: 20
        ),),
      ),
    );
  }
}
