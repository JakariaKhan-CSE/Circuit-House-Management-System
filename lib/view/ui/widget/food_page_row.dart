
import 'package:flutter/material.dart';

class foodPageRow extends StatelessWidget {
  final String leftText;
  final String rightText;
  const foodPageRow({
    super.key, required this.leftText, required this.rightText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      child: Row(

        children: [
          Expanded(
              flex: 2,
              child: Text(leftText,style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700
              ),)),
          const Expanded(
              flex: 1,
              child: Text(':',style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700
              ))),
          Expanded(
              flex: 5,
              child: Container(
                  height: 32,
                  color: const Color(0xFFD9D9D9),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text(rightText, overflow: TextOverflow.ellipsis, style: const TextStyle(
                      color: Colors.black,
                    ),),
                  )))
        ],
      ),
    );
  }
}