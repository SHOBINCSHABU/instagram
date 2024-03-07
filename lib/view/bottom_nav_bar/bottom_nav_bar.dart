import 'package:flutter/material.dart';
import 'package:instagram/core/constants/color_constants.dart';
import 'package:instagram/core/constants/image_constants.dart';
import 'package:instagram/view/add_image_screen/add_image_screen.dart';
import 'package:instagram/view/home_screen.dart';
import 'package:instagram/view/profile_screen/profile_screen.dart';
import 'package:instagram/view/search_screen/search_screen.dart';

class bottomNavigationBarScreen extends StatefulWidget {
  const bottomNavigationBarScreen({super.key});

  @override
  State<bottomNavigationBarScreen> createState() =>
      _bottomNavigationBarScreenState();
}

class _bottomNavigationBarScreenState extends State<bottomNavigationBarScreen> {
  List<Widget> ScreenList = [
    HomeScreen(),
    SearchScreen(),
    
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.red,
    ),
    Profilescreen(),
  ];

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenList[selectedIndex],
      bottomNavigationBar: SizedBox(
        child: BottomNavigationBar(
          selectedItemColor: ColorConstants.primaryBlack,
          onTap: (value) {
            if (value != 2) {
              selectedIndex = value;
              setState(() {});
            } else {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddImageScreen(),
                  ));
            }
          },
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home_filled,), label: ""),
          const BottomNavigationBarItem(icon: Icon(Icons.search,), label: ""),

          BottomNavigationBarItem(
              icon: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all()),
                  child: const Icon(Icons.add,)),
              label: ""),
          const BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_outlined,), label: ""),
          const BottomNavigationBarItem(
              icon: CircleAvatar(
                radius: 15,
                backgroundImage: AssetImage(ImageConstants.shobinProfilePhoto),
              ),
              label: ""),
        ],
      ),),
    );
  }
}
