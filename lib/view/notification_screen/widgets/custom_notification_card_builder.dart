import 'package:flutter/material.dart';
import 'package:instagram/view/notification_screen/widgets/custom_notification_card.dart';

class CustomNotificationCardBuilder extends StatelessWidget {
  const CustomNotificationCardBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      padding: EdgeInsets.only(left: 16, right: 16, top: 13),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Title"),
          SizedBox(
            height: 13,
          ),
          Column(
            children: List.generate(4, (index) => CustomNotificationCard()),
          )
        ],
      ),
    );
  }
}