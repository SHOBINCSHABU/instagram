import 'package:flutter/material.dart';
import 'package:instagram/core/constants/image_constants.dart';

class SelectAccountScreen extends StatelessWidget {
  const SelectAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              ImageConstants.instagramtextlogo
            ),
            SizedBox(
              height: 20,
            ),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                ImageConstants.appIcon),
            ),
            SizedBox(
              height: 20,
            ),
            Text("shobin_chelamattam",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(5)
              ),
              child: Center(
                child: Text(
                  "Log in",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            TextButton(
              onPressed: () {}, 
              child: Text("Switch Account",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.blue),
                )
              )
          ],
        ),
      ),
    );
  }
}