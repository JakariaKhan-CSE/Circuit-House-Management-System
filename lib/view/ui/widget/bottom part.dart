import 'package:flutter/cupertino.dart';

import 'components.dart';

class BottomPart extends StatelessWidget {
  const BottomPart({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ContactInformation(),
        SizedBox(height: 15,),
        QuickLinks(),
        SizedBox(height: 15,),
        FollowUs()
      ],
    );
  }
}
