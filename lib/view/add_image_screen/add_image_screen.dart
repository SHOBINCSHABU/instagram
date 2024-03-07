import 'package:flutter/material.dart';
import 'package:instagram/core/constants/color_constants.dart';
import 'package:instagram/view/tabs/library_tab.dart';
import 'package:instagram/view/tabs/photo_tab.dart';
import 'package:instagram/view/tabs/video_tab.dart';

class AddImageScreen extends StatelessWidget {
  const AddImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 80,
          leading: TextButton(
            child: Text(
              "Cancel",
              style: TextStyle(
                color: ColorConstants.primaryBlack, 
                fontSize: 16,
                fontWeight: FontWeight.w500
                ),),
                onPressed: () {
                  Navigator.pop(context);
                },
          ),
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Recents",
                style: TextStyle(
                  fontWeight: FontWeight.bold),),
                  SizedBox(width: 10,),
                Icon(Icons.keyboard_arrow_down_outlined)
            ],
          ),
          titleTextStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: ColorConstants.primaryBlack
          ),
          centerTitle: true,
          actions: [
            TextButton(
            child: Text(
              "Next",
            style: TextStyle(
              color: ColorConstants.normalBlue,
              fontSize: 16,
            ),),
            onPressed: () {},
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://images.pexels.com/photos/20433278/pexels-photo-20433278/free-photo-of-indian-blue-jay.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load"))),
              height: 375,
              alignment: Alignment.bottomRight,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: ColorConstants.primaryBlack.withOpacity(.4),
                          borderRadius: BorderRadius.circular(50)),
                      child: Icon(
                        Icons.all_inclusive,
                        size: 25,
                        color: const Color.fromARGB(117, 158, 158, 158),
                      )),
                  SizedBox(
                    width: 16,
                  ),
                  Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: ColorConstants.primaryBlack.withOpacity(.4),
                          borderRadius: BorderRadius.circular(50)),
                      child: Icon(
                        Icons.space_dashboard_outlined,
                        size: 25,
                        color: const Color.fromARGB(117, 158, 158, 158),
                      )),
                  SizedBox(
                    width: 16,
                  ),
                  Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: ColorConstants.primaryBlack.withOpacity(.4),
                          borderRadius: BorderRadius.circular(50)),
                      child: Row(
                        children: [
                          Icon(
                            Icons.filter_none,
                            size: 25,
                        color: const Color.fromARGB(117, 158, 158, 158),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Text(
                            "SELECT MULTIPPLE",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: ColorConstants.primaryWhite),
                          ),
                        ],
                      )),
                ],
              ),
            ),
            Expanded(
                child: TabBarView(children: [
              LibraryTab(),
              PhotoTab(),
              VideoTab(),
            ]))
          ],
        ),
        bottomNavigationBar: TabBar(
            indicatorWeight: 1,
            dividerHeight: 0,
            labelColor: ColorConstants.primaryBlack,
            unselectedLabelColor: ColorConstants.primaryBlack.withOpacity(.3),
            indicator: BoxDecoration(),
            tabs: [
              Tab(
                text: "Library",
              ),
              Tab(
                text: "Photo",
              ),
              Tab(
                text: "Video",
              ),
            ]),
      ),
    );
  }
}