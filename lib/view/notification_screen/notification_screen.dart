import 'package:flutter/material.dart';
// import 'package:instagram/core/constants/color_constants.dart';
import 'package:instagram/view/notification_screen/widgets/custom_notification_card.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, 
      child: Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(0), 
            child: TabBar(
              tabs: [Tab(
              text: "Following",
            ),
            Tab(
              text: "You",
            )])),
        ),
        body: 
        Container(child: CustomNotificationCard(),)
        // TabBarView(children: [
        //   Container(
        //   color: ColorConstants.normalRed,
        // ),
        // Container(+
        //   color: ColorConstants.normalYellow,
        // ),
        // Container(
        //   child: CustomNotificationCard(),
        // )
        // ]),
      ));
  }
}