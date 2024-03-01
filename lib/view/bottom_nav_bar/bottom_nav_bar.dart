import 'package:flutter/material.dart';
import 'package:instagram/core/constants/image_constants.dart';
import 'package:instagram/core/select_account_screen.dart';
import 'package:instagram/view/home_screen.dart';

class bottomNavigationBarScreen extends StatefulWidget {
  const bottomNavigationBarScreen({super.key});

  @override
  State<bottomNavigationBarScreen> createState() =>
      _bottomNavigationBarScreenState();
}

class _bottomNavigationBarScreenState extends State<bottomNavigationBarScreen> {
  List<Widget> ScreenList = [
    HomeScreen(),
    Container(
      color: Colors.amber,
    ),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.pink,
    ),
  ];

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenList[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          if (value != 2) {
            selectedIndex = value;
            setState(() {});
          } else {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SelectAccountScreen(),
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
      ),
    );
  }
}
