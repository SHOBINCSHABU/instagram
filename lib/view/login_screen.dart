import 'package:flutter/material.dart';
import 'package:instagram/core/constants/color_constants.dart';
import 'package:instagram/core/constants/image_constants.dart';
import 'package:instagram/global_widgets/custom_button.dart';
import 'package:instagram/view/bottom_nav_bar/bottom_nav_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(ImageConstants.instagramtextlogo),
              SizedBox(
                height: 39,
              ),
              TextField(
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 11.5, horizontal: 15),
                    filled: true,
                    hintText: "Phone number,email or username",
                    labelStyle: TextStyle(color: ColorConstants.primaryBlack),
                    hintStyle: TextStyle(
                        color: ColorConstants.primaryBlack.withOpacity(.2)),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    )),
              ),
              SizedBox(
                height: 12,
              ),
              TextField(
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 11.5, horizontal: 15),
                    filled: true,
                    hintText: "Password",
                    labelStyle: TextStyle(color: ColorConstants.primaryBlack),
                    hintStyle: TextStyle(
                        color: ColorConstants.primaryBlack.withOpacity(.2)),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    )),
              ),
              SizedBox(
                height: 19,
              ),
              Container(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forgot password?",
                  style: TextStyle(color: ColorConstants.primaryBlue),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              CustomButton(
                  buttonColor: nameController.text.isNotEmpty &&
                          passController.text.isNotEmpty
                      ? ColorConstants.primaryBlue
                      : ColorConstants.primaryBlue.withOpacity(.4),
                  text: "Log in",
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => bottomNavigationBarScreen()),
                        (route) => false);
                  },
                ),
                SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    ImageConstants.facebookLogo,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Log in With Facebook",
                    style: TextStyle(
                        color: ColorConstants.primaryBlue,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 41.5,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 8, right: 30),
                      child: Divider(
                        height: 36,
                      ),
                    ),
                  ),
                  Text(
                    "OR",
                    style: TextStyle(
                        color: ColorConstants.primaryBlack.withOpacity(.4)),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 30, right: 8),
                      child: Divider(
                        height: 36,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 41.5,
              ),
              Container(
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: "Dont you have an account? ",
                          style: TextStyle(
                              color:
                                  ColorConstants.primaryBlack.withOpacity(.4)),
                          children: [
                            TextSpan(
                                text: "Sign Up",
                                style: TextStyle(
                                    color: ColorConstants.primaryBlue,
                                    fontWeight: FontWeight.w500))
                          ]))),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 25),
        decoration: BoxDecoration(border: Border(top: BorderSide(width: .1))),
        child: Text(
          "Instagram OR Facebook",
          textAlign: TextAlign.center,
          style: TextStyle(color: ColorConstants.primaryBlack.withOpacity(.4)),
        ),
      ),
    );
  }
}