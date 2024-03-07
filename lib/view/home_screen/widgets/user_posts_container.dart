import 'package:flutter/material.dart';
import 'package:instagram/core/constants/color_constants.dart';

class CustomPostsContainer extends StatefulWidget {
  const CustomPostsContainer({
    super.key,
    required this.userName,
    required this.proPic,
    required this.location,
    required this.postImagesList,
    this.isLiked = false,
    this.caption,
  });

  final String userName;
  final String proPic;
  final String location;
  final List<String> postImagesList;
  final bool isLiked;
  final String? caption;

  @override
  State<CustomPostsContainer> createState() => _CustomPostsContainerState();
}

class _CustomPostsContainerState extends State<CustomPostsContainer> {
  int currentPage = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstants.primaryWhite,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 16,
              backgroundImage: NetworkImage(widget.proPic),
            ),
            title: Row(
              children: [
                Text(
                  widget.userName,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                ),
                SizedBox(width: 10),
                Icon(
                  Icons.verified,
                  size: 15,
                  color: ColorConstants.normalBlue,
                )
              ],
            ),
            subtitle: Text(
              widget.location,
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 11),
            ),
            trailing: Icon(Icons.more_horiz),
          ),
          Stack(
            children: [
              SizedBox(
                height: 375,
                child: PageView.builder(
                  onPageChanged: (value) {
                    currentPage = value + 1;
                    setState(() {});
                  },
                  itemCount: widget.postImagesList.length,
                  itemBuilder: (context, index) => Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(widget.postImagesList[index]))),
                  ),
                ),
              ),
              Positioned(
                right: 20,
                top: 20,
                child: Container(
                  decoration: BoxDecoration(
                      color: ColorConstants.primaryBlack.withOpacity(.6),
                      borderRadius: BorderRadius.circular(15)),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Text(
                    "$currentPage/${widget.postImagesList.length}",
                    style: TextStyle(color: ColorConstants.primaryWhite),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        widget.isLiked == true
                            ? Icon(
                                Icons.favorite_rounded,
                                size: 25,
                                color: ColorConstants.normalRed,
                              )
                            : Icon(Icons.favorite_border, size: 25),
                        SizedBox(width: 16),
                        Icon(Icons.maps_ugc_rounded, size: 25),
                        SizedBox(width: 16),
                        Icon(Icons.send, size: 25),
                      ],
                    ),
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          widget.postImagesList.length,
                          (index) => Padding(
                                padding: const EdgeInsets.only(left: 3),
                                child: CircleAvatar(
                                  backgroundColor: (index == currentPage - 1)
                                      ? ColorConstants.primaryBlue
                                      : Colors.grey.withOpacity(.3),
                                  radius: (index == currentPage - 1) ? 5 : 3,
                                ),
                              )),
                    )),
                    Icon(Icons.bookmark_border, size: 25),
                  ],
                ),
                SizedBox(
                  height: 13.5,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(widget.proPic),
                      radius: 10,
                    ),
                    SizedBox(width: 16),
                    RichText(
                        text: TextSpan(
                            text: "Liked by ",
                            style:
                                TextStyle(color: ColorConstants.primaryBlack),
                            children: [
                          TextSpan(
                            text: "user_name ",
                            style: TextStyle(
                                color: ColorConstants.primaryBlack,
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: "and "),
                          TextSpan(
                            text: "56,789 others ",
                            style: TextStyle(
                                color: ColorConstants.primaryBlack,
                                fontWeight: FontWeight.bold),
                          ),
                        ])),
                  ],
                ),
                SizedBox(height: 13.5),
                RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                        text: widget.userName,
                        style: TextStyle(
                            color: ColorConstants.primaryBlack,
                            fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                            text: " ${widget.caption}" ?? "",
                            style: TextStyle(
                                color: ColorConstants.primaryBlack,
                                fontWeight: FontWeight.normal),
                          )
                        ])),
                SizedBox(height: 13.5),
                Text(
                  "September 18",
                  style: TextStyle(
                      color: ColorConstants.primaryBlack.withOpacity(.5),
                      fontSize: 11,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
