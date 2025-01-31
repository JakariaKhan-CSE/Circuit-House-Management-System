import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function()? pressed;
  final String btnName;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double height;
  final double width;
  const CustomButton({
    super.key,
    required this.pressed, required this.btnName, this.backgroundColor, this.foregroundColor,
    this.height = 40, this.width = 200
  });



  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: pressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: backgroundColor
        ),
        child: Center(
          child: Text(btnName,style: TextStyle(
            color: foregroundColor,
            fontSize: 15
          ),),
        ),
      ),
    );
  }
}