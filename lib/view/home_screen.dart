import 'package:flutter/material.dart';
import 'package:instagram/core/constants/image_constants.dart';
import 'package:instagram/view/dummydb.dart';
import 'package:instagram/view/home_screen/widgets/custom_story_avatar.dart';
import 'package:instagram/view/home_screen/widgets/user_posts_container.dart';

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
            IconButton(onPressed: () {}, icon: Icon(Icons.live_tv)),
            IconButton(onPressed: () {}, icon: Icon(Icons.send)),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //#1 custom story section
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
              ),

              //#2 custom posts section

              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: DummyDb.homePostsList.length,
                itemBuilder: (context, index) => CustomPostsContainer(
                  userName: DummyDb.homePostsList[index]["userName"].toString(),
                  location: DummyDb.homePostsList[index]["location"].toString(),
                  postImagesList: DummyDb.homePostsList[index]["posts"],
                  proPic: DummyDb.homePostsList[index]["proPic"].toString(),
                  caption: DummyDb.homePostsList[index]["caption"].toString(),
                  isLiked: DummyDb.homePostsList[index]["liked"],
                ),
              )
            ],
          ),
        ));
  }
}
