import 'package:flutter/material.dart';
import 'package:instagram/core/constants/image_constants.dart';
import 'package:instagram/view/dummydb.dart';
import 'package:instagram/view/home_screen/widgets/custom_story_avatar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Icon(Icons.camera_alt_outlined),
        title: Image.asset(
          ImageConstants.instagramtextlogo,
          scale: 1.5,
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.live_tv_outlined)),
            IconButton(onPressed: () {}, icon: Icon(Icons.near_me_outlined)),
          ],
      ),
      body: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                    DummyDb.StoryList.length,
                    (index) => CustomStoryAvatar(
                          proPic: DummyDb.StoryList[index]["proPic"],
                          userName: DummyDb.StoryList[index]["userName"],
                          isLive: DummyDb.StoryList[index]["isLive"],
                        )),
              ),
            )
          ],
        )
    );
  }
}