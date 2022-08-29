import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/pages/bottom_bar.dart';
import 'package:chat_app/pages/chat/full_screen_image.dart';
import 'package:chat_app/widget/column_builder.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GroupProfile extends StatefulWidget {
  final String? userName, userImage;
  GroupProfile({Key? key, required this.userName, required this.userImage})
      : super(key: key);
  @override
  _GroupProfileState createState() => _GroupProfileState();
}

class _GroupProfileState extends State<GroupProfile> {
  static List<String> choices = <String>['Edit', 'Report', 'Exit group'];

  final participantsList = [
    {
      'name': 'You',
      'image': 'assets/user_profile/user_3.jpg',
      'about': 'Your limitation—it’s only your imagination.',
      'role': ''
    },
    {
      'name': 'John',
      'image': 'assets/user_profile/user_2.jpg',
      'about': 'Push yourself, because no one else is going to do it for you.',
      'role': 'admin'
    },
    {
      'name': 'Jack Smith',
      'image': 'assets/user_profile/user_1.jpg',
      'about': 'Sometimes later becomes never. Do it now.',
      'role': ''
    },
    {
      'name': 'Appolinia',
      'image': 'assets/user_profile/user_4.jpg',
      'about': 'Great things never come from comfort zones.',
      'role': ''
    },
    {
      'name': 'Alexander',
      'image': 'assets/user_profile/user_5.jpg',
      'about': 'Dream it. Wish it. Do it.',
      'role': ''
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBgColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: whiteColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          widget.userName!,
          style: appBarTextStyle,
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: choiceAction,
            itemBuilder: (BuildContext context) {
              return choices.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          about(),
          heightSpace,
          participants(),
          heightSpace,
          reportLeave(),
          heightSpace,
        ],
      ),
    );
  }

  about() {
    return Container(
      color: whiteColor,
      padding: EdgeInsets.all(fixPadding * 2.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(65.0),
            child: InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          FullScreenImage(imagePath: widget.userImage))),
              child: Hero(
                tag: widget.userImage!,
                child: Image.asset(
                  widget.userImage!,
                  width: 130.0,
                  height: 130.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          heightSpace,
        ],
      ),
    );
  }

  participants() {
    return Container(
      color: whiteColor,
      padding: EdgeInsets.all(fixPadding * 2.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '5 participants',
            style: greyNormalTextStyle,
          ),
          ColumnBuilder(
            itemCount: participantsList.length,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            itemBuilder: (context, index) {
              final item = participantsList[index];
              return Container(
                padding: (index == 0)
                    ? EdgeInsets.only(
                        top: fixPadding * 2.0,
                        bottom: fixPadding,
                      )
                    : (index == participantsList.length - 1)
                        ? EdgeInsets.only(
                            top: fixPadding,
                            bottom: 0.0,
                          )
                        : EdgeInsets.only(
                            top: fixPadding,
                            bottom: fixPadding,
                          ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 46.0,
                      height: 46.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(23.0),
                        image: DecorationImage(
                          image: AssetImage(item['image']!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    widthSpace,
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(item['name']!, style: blackNormalTextStyle),
                              (item['role'] == 'admin')
                                  ? Container(
                                      padding: EdgeInsets.all(3.0),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        border: Border.all(
                                            width: 0.8, color: primaryColor),
                                      ),
                                      child: Text(
                                        'admin',
                                        style: TextStyle(
                                          color: primaryColor,
                                          fontSize: 12.0,
                                        ),
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                          SizedBox(height: 3.0),
                          Text(
                            item['about']!,
                            style: greySmallTextStyle,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  reportLeave() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            Fluttertoast.showToast(
              msg: 'Report',
              backgroundColor: Colors.black,
              textColor: whiteColor,
            );
          },
          child: Container(
            color: whiteColor,
            padding: EdgeInsets.all(fixPadding * 2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.thumb_down,
                  size: 22.0,
                  color: primaryColor,
                ),
                widthSpace,
                Text(
                  'Report group',
                  style: msgTextStyle,
                ),
              ],
            ),
          ),
        ),
        heightSpace,
        InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => BottomBar()));
          },
          child: Container(
            color: whiteColor,
            padding: EdgeInsets.all(fixPadding * 2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.exit_to_app,
                  size: 22.0,
                  color: primaryColor,
                ),
                widthSpace,
                Text(
                  'Exit group',
                  style: msgTextStyle,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void choiceAction(String choice) {
    if (choice == 'Edit') {
      Fluttertoast.showToast(
        msg: 'Edit',
        backgroundColor: Colors.black,
        textColor: whiteColor,
      );
    } else if (choice == 'Report') {
      Fluttertoast.showToast(
        msg: 'Report',
        backgroundColor: Colors.black,
        textColor: whiteColor,
      );
    } else if (choice == 'Exit group') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => BottomBar()));
    }
  }
}
