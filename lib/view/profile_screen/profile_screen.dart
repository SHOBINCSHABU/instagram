import 'package:flutter/material.dart';
import 'package:instagram/core/constants/color_constants.dart';
import 'package:instagram/core/constants/image_constants.dart';
import 'package:instagram/global_widgets/custom_button.dart';
import 'package:instagram/view/dummydb.dart';
import 'package:instagram/view/profile_screen/widgets/custom_profile_data.dart';


class Profilescreen extends StatefulWidget {
  const Profilescreen({super.key});

  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen> {
  var currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.lock),
              Text("_.punyalan._"),
              Icon(Icons.keyboard_arrow_down_rounded),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.menu),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 20, bottom: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 48,
                          backgroundColor:
                              ColorConstants.primaryBlack.withOpacity(.1),
                          child: CircleAvatar(
                              radius: 46,
                              backgroundColor: ColorConstants.primaryWhite,
                              child: CircleAvatar(
                                radius: 43,
                                backgroundColor: ColorConstants.primaryBlack,
                                backgroundImage: AssetImage(
                                  ImageConstants.shobinProfilePhoto
                                ))),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomProfileData(
                                  title: "Posts", value: "20"),
                              CustomProfileData(
                                  title: "Followers", value: "2000"),
                              CustomProfileData(
                                  title: "Following", value: "1000"),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Shobin C Shabu",
                      style: TextStyle(
                          color: ColorConstants.primaryBlack,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "I'M NOT PERFEST BUT I'M LIMITED EDITION \n... FIRST CRY on 04 April... \n... Own RúĽÊś....",
                      maxLines: 3,
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    CustomButton(
                      text: "Edit Profile",
                      haveBorder: true,
                      // verticalPadding: 5,
                      buttonColor: ColorConstants.transparent,
                      textColor: ColorConstants.primaryBlack,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Column(
                            children: [
                              CircleAvatar(
                                radius: 32,
                                backgroundColor:
                                    ColorConstants.primaryBlack.withOpacity(.1),
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundColor: ColorConstants.primaryWhite,
                                  child: Icon(Icons.add),
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                "Add",
                                style: TextStyle(
                                    color: ColorConstants.primaryBlack,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                          Row(
                            children: List.generate(
                              10,
                              (index) => Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 32,
                                      backgroundColor: ColorConstants
                                          .primaryBlack
                                          .withOpacity(.1),
                                      child: CircleAvatar(
                                          radius: 30,
                                          backgroundColor:
                                              ColorConstants.primaryWhite,
                                          child: CircleAvatar(
                                            radius: 28,
                                            backgroundColor:
                                                ColorConstants.primaryBlack,
                                            backgroundImage: NetworkImage(
                                                "https://images.pexels.com/photos/20447512/pexels-photo-20447512/free-photo-of-photo-of-a-young-woman-wearing-headphones-and-a-beige-coat-holding-a-laptop-on-a-street.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load"),
                                          )),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      "WoW",
                                      style: TextStyle(
                                          color: ColorConstants.primaryBlack,
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                height: 0,
              ),
              TabBar(
                  indicatorWeight: 1,
                  dividerHeight: 0,
                  indicatorColor: ColorConstants.primaryBlack,
                  labelColor: ColorConstants.primaryBlack,
                  unselectedLabelColor:
                      ColorConstants.primaryBlack.withOpacity(.3),
                  indicatorSize: TabBarIndicatorSize.tab,
                  onTap: (index) {
                    setState(() {
                      currentTabIndex = index;
                    });
                  },
                  tabs: [
                    Tab(
                      icon: Icon(Icons.grid_on_sharp),
                    ),
                    Tab(
                      icon: Icon(Icons.person_pin_rounded),
                    )
                  ]),
              currentTabIndex == 0
                  ? GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: DummyDb.postsList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 2,
                          crossAxisSpacing: 2,
                          crossAxisCount: 3),
                      itemBuilder: (context, index) => Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(DummyDb.postsList[index]))),
                      ),
                    )
                  : GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: DummyDb.taggedPostsList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 2,
                          crossAxisSpacing: 2,
                          crossAxisCount: 3),
                      itemBuilder: (context, index) => Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    DummyDb.taggedPostsList[index]))),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
