import 'package:flutter/material.dart';
import 'package:instagram/core/constants/color_constants.dart';
import 'package:instagram/core/constants/image_constants.dart';
import 'package:instagram/global_widgets/custom_button.dart';
import 'package:instagram/view/login_screen.dart';

class SelectAccountScreen extends StatelessWidget {
  const SelectAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(ImageConstants.instagramtextlogo),
              SizedBox(height: 50),
              CircleAvatar(
                backgroundImage: AssetImage(
                  ImageConstants.shobinProfilePhoto
                ),
                radius: 50,
              ),
              SizedBox(height: 15),
              Text(
                "_.punyalan._",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 10),
              CustomButton(
                text: "Log in",
                onTap: () {
                  Navigator.pushReplacement(
                    context, 
                    MaterialPageRoute(builder: (context) => LoginScreen(),));
                },
              ),
              SizedBox(height: 30),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Switch accounts",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: ColorConstants.primaryBlue),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 25),
        decoration: BoxDecoration(border: Border(top: BorderSide(width: .1))),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: "Dont have an account? ",
              style:
                  TextStyle(color: ColorConstants.primaryBlack.withOpacity(.4)),
              children: [
                TextSpan(
                  text: "Sign Up",
                  style: TextStyle(
                      color: ColorConstants.primaryBlack,
                      fontWeight: FontWeight.bold),
                )
              ]),
        ),
      ),
    );
  }
}