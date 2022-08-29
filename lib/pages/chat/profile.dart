import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/pages/chat/full_screen_image.dart';
import 'package:chat_app/pages/chat/message_screen.dart';
import 'package:chat_app/pages/phone_call.dart';
import 'package:chat_app/pages/video_call.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Profile extends StatefulWidget {
  final String? userName, userImage;
  Profile({Key? key, required this.userName, required this.userImage})
      : super(key: key);
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  static List<String> choices =['Report', 'Block'];

  final mediaList = [
    {'image': 'assets/hotel/hotel_1.jpg'},
    {'image': 'assets/hotel/hotel_2.jpg'},
    {'image': 'assets/hotel/hotel_3.jpg'},
    {'image': 'assets/hotel/hotel_4.jpg'},
    {'image': 'assets/hotel/hotel_5.jpg'},
    {'image': 'assets/hotel/hotel_6.jpg'},
    {'image': 'assets/hotel/hotel_7.jpg'},
    {'image': 'assets/hotel/hotel_8.jpg'}
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
          sharedMedia(),
          heightSpace,
          phoneNumber(),
          heightSpace,
          block(),
          heightSpace,
          report(),
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
            child: Image.asset(
              widget.userImage!,
              width: 130.0,
              height: 130.0,
              fit: BoxFit.cover,
            ),
          ),
          heightSpace,
          Material(
            elevation: 1.0,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
            ),
            child: Container(
              padding: EdgeInsets.all(fixPadding),
              decoration: BoxDecoration(
                color: scaffoldBgColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                ),
              ),
              child: Text(
                '\"All our dreams can come true, if we have the courage to pursue them.\"',
                style: nemeTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  sharedMedia() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: fixPadding * 2.0),
      color: whiteColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: fixPadding,
              bottom: fixPadding * 2.0,
            ),
            child: Text(
              'Shared Media',
              style: blackHeadingTextStyle,
            ),
          ),
          Container(
            height: 80.0,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final item = mediaList[index];
                return Padding(
                  padding: (index != 5)
                      ? EdgeInsets.only(left: fixPadding)
                      : EdgeInsets.only(
                          left: fixPadding,
                          right: fixPadding,
                        ),
                  child: (index != 5)
                      ? InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FullScreenImage(
                                          imagePath: item['image'],
                                        )));
                          },
                          child: Hero(
                            tag: item['image']!,
                            child: Image.asset(
                              item['image']!,
                              width: 80.0,
                              height: 80.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FullScreenImage(
                                              imagePath: item['image'],
                                            )));
                              },
                              child: Hero(
                                tag: item['image']!,
                                child: Image.asset(
                                  item['image']!,
                                  width: 80.0,
                                  height: 80.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            widthSpace,
                            Container(
                              width: 80.0,
                              height: 80.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage(mediaList[index + 1]['image']!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Container(
                                width: 80.0,
                                height: 80.0,
                                color: blackColor.withOpacity(0.7),
                                alignment: Alignment.center,
                                child: Text(
                                  'View all',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: whiteColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  phoneNumber() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: fixPadding * 2.0),
      color: whiteColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: fixPadding,
              bottom: fixPadding * 2.0,
            ),
            child: Text(
              'Phone Number',
              style: blackHeadingTextStyle,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: fixPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '+1 123456',
                      style: blackNormalTextStyle,
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      'Mobile',
                      style: msgTextStyle,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.chat,
                        color: primaryColor,
                      ),
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => MessageScreen(
                        //             name: widget.userName,
                        //             imagePath: widget.userImage)));
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.call,
                        color: primaryColor,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PhoneCall(
                                    name: widget.userName,
                                    imagePath: widget.userImage)));
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.videocam,
                        color: primaryColor,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    VideoCall(name: widget.userName)));
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  block() {
    return InkWell(
      onTap: () {
        Fluttertoast.showToast(
          msg: 'Block',
          backgroundColor: Colors.black,
          textColor: whiteColor,
        );
      },
      child: Container(
        color: whiteColor,
        padding: EdgeInsets.only(
          top: fixPadding * 2.0,
          bottom: fixPadding * 2.0,
          right: fixPadding,
          left: fixPadding,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.block,
              color: Colors.red,
              size: 22.0,
            ),
            widthSpace,
            Text(
              'Block',
              style: TextStyle(
                color: Colors.red,
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  report() {
    return InkWell(
      onTap: () {
        Fluttertoast.showToast(
          msg: 'Report Contact',
          backgroundColor: Colors.black,
          textColor: whiteColor,
        );
      },
      child: Container(
        color: whiteColor,
        padding: EdgeInsets.only(
          top: fixPadding * 2.0,
          bottom: fixPadding * 2.0,
          right: fixPadding,
          left: fixPadding,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.thumb_down,
              color: Colors.red,
              size: 22.0,
            ),
            widthSpace,
            Text(
              'Report contact',
              style: TextStyle(
                color: Colors.red,
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void choiceAction(String choice) {
    if (choice == 'Report') {
      Fluttertoast.showToast(
        msg: 'Report',
        backgroundColor: Colors.black,
        textColor: whiteColor,
      );
    } else if (choice == 'Block') {
      Fluttertoast.showToast(
        msg: 'Block',
        backgroundColor: Colors.black,
        textColor: whiteColor,
      );
    }
  }
}
