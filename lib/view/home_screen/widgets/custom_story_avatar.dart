import 'package:flutter/material.dart';
import 'package:instagram/core/constants/color_constants.dart';

class CustomStoryAvatar extends StatelessWidget {
  const CustomStoryAvatar({
    super.key,
    this.isLive = false,
    required this.proPic,
    required this.userName,
  });

  final String proPic;
  final String userName;
  final bool isLive;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              SizedBox(
                height: 110,
              ),
              Container(
                padding: EdgeInsets.all(3),
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient:
                        LinearGradient(end: Alignment.bottomRight, colors: [
                      ColorConstants.story1,
                      ColorConstants.story2,
                      ColorConstants.story3,
                    ])),
                child: Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: ColorConstants.primaryWhite,
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(proPic),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: isLive == true
                    ? Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                colors: [
                                  ColorConstants.normalPink,
                                  ColorConstants.normalRed,
                                ]),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                width: 4, color: ColorConstants.primaryWhite)),
                        child: Center(
                          child: Text(
                            "Live",
                            style: TextStyle(
                                color: ColorConstants.primaryWhite,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    : SizedBox(),
              )
            ],
          ),
          SizedBox(height: 3),
          Text(userName)
        ],
      ),
    );
  }
}