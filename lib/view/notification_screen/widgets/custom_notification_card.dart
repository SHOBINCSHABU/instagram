import 'package:flutter/material.dart';
import 'package:instagram/core/constants/color_constants.dart';

class CustomNotificationCard extends StatefulWidget {
  const CustomNotificationCard({super.key});

  @override
  State<CustomNotificationCard> createState() => _CustomNotificationCardState();
}

class _CustomNotificationCardState extends State<CustomNotificationCard> {
  @override
  Widget build(BuildContext context) {
    // List profileImage = ["", ""];
    return Container(
      padding: EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          // profileImage.length < 2 ?,
          CircleAvatar(
            radius: 22,
          ),
          SizedBox(width: 22,),
          Text("keran_a Liked Your photo.  1h"),
          Spacer(),
          Container(
            height: 44,
            width: 44,
            color: ColorConstants.normalRed,
          )
        ],
      ),
    );
  }
}