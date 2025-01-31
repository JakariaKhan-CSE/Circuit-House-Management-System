import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  final String text;
  const Heading({
    super.key, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(text,textAlign: TextAlign.right, overflow: TextOverflow.ellipsis,style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: Colors.black
      ),),
    );
  }
}

class Data extends StatelessWidget {
  final String text;
     final bool isButton;
     final bool isBold;
  final void Function()? onTap;
  const Data({
    super.key, required this.text,
    this.isButton = false,
     this.isBold = false, this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: isButton ? GestureDetector(

        onTap: onTap,
        child: Container(
          height: 26,
          decoration: BoxDecoration(
            color: const Color(0xFF44E36F),
            border: Border.all(color: Colors.black)
          ),
          child: Center(
            child: Text(text,textAlign : TextAlign.left,style: TextStyle(
                fontSize: 12,
                fontWeight: isBold? FontWeight.w700: FontWeight.w400,
                color: Colors.black
            ),),
          ),
        ),
      ) :Text(text,textAlign: TextAlign.left, overflow: TextOverflow.ellipsis,style: TextStyle(
          fontSize: 12,
          fontWeight: isBold? FontWeight.w700: FontWeight.w400,
          color: Colors.black
      ),),
    );
  }
}
class AnotherHeading extends StatelessWidget {
  final String text;
  const AnotherHeading({
    super.key, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Text(text,textAlign: TextAlign.right, overflow: TextOverflow.ellipsis, maxLines: 2,style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.normal,
          color: Colors.black
      ),),
    );
  }
}

class AnotherData extends StatelessWidget {
  final String text;
  final bool isButton;
  final bool isBold;
  final void Function()? onTap;
  const AnotherData({
    super.key, required this.text,
    this.isButton = false,
    this.isBold = false, this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: isButton ? GestureDetector(

        onTap: onTap,
        child: Container(
          height: 26,
          decoration: BoxDecoration(
              color: const Color(0xFF44E36F).withOpacity(0.6),
              border: Border.all(color: Colors.black)
          ),
          child: Center(
            child: Text(text,textAlign : TextAlign.left,style: TextStyle(
                fontSize: 15,
                fontWeight: isBold? FontWeight.normal: FontWeight.normal,
                color: Colors.black
            ),),
          ),
        ),
      ) :Text(text,textAlign: TextAlign.left,style: TextStyle(
          fontSize: 14,
          fontWeight: isBold? FontWeight.normal: FontWeight.normal,
          color: Colors.black
      ),),
    );
  }
}
