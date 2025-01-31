import 'package:flutter/material.dart';

class FollowUs extends StatelessWidget {
  const FollowUs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        boldText(text: 'Follow Us',),
        Text('Facebook'),
        Text('Instagram'),
      ],
    );
  }
}

class QuickLinks extends StatelessWidget {
  const QuickLinks({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        boldText(text: 'Quick Links',),
        Text('DC Website'),
        Text('Add Booking'),
        Text('Add Order'),

      ],
    );
  }
}

class ContactInformation extends StatelessWidget {
  const ContactInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        boldText(text: 'Contact Information',),
        Text('Circuit House'),
        Text('Jashore,Bangladesh'),
        Text('Email: 123@gmail.com'),
        Text('Phone: +8801733909222')
      ],
    );
  }
}

class boldText extends StatelessWidget {
  final String text;
  const boldText({
    super.key, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600
    ),);
  }
}