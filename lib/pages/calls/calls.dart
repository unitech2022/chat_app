import 'package:chat_app/animation/fadeIn.dart';
import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/pages/phone_call.dart';
import 'package:chat_app/pages/video_call.dart';
import 'package:flutter/material.dart';

class Calls extends StatefulWidget {
  @override
  _CallsState createState() => _CallsState();
}

class _CallsState extends State<Calls> {
  final callList = [
    {
      'name': 'Ronan',
      'image': 'assets/user_profile/user_1.jpg',
      'time': 'June 09, 11:30 PM',
      'type': 'voice',
      'callStatus': 'dial'
    },
    {
      'name': 'Brayden',
      'image': 'assets/user_profile/user_2.jpg',
      'time': 'June 09, 10:14 PM',
      'type': 'video',
      'callStatus': 'receive'
    },
    {
      'name': 'Apollonia',
      'image': 'assets/user_profile/user_3.jpg',
      'time': 'June 08, 10:30 AM',
      'type': 'voice',
      'callStatus': 'missed'
    },
    {
      'name': 'Beatriz',
      'image': 'assets/user_profile/user_4.jpg',
      'time': 'June 07, 12:30 AM',
      'type': 'video',
      'callStatus': 'dial'
    },
    {
      'name': 'Shira',
      'image': 'assets/user_profile/user_5.jpg',
      'time': 'June 06, 10:30 AM',
      'type': 'video',
      'callStatus': 'missed'
    },
    {
      'name': 'Diego',
      'image': 'assets/user_profile/user_6.jpg',
      'time': 'June 05, 08:40 AM',
      'type': 'voice',
      'callStatus': 'receive'
    },
    {
      'name': 'Marco',
      'image': 'assets/user_profile/user_7.jpg',
      'time': 'June 04, 09:35 AM',
      'type': 'video',
      'callStatus': 'dial'
    },
    {
      'name': 'Steffan',
      'image': 'assets/user_profile/user_8.jpg',
      'time': 'June 04, 07:12 AM',
      'type': 'voice',
      'callStatus': 'missed'
    }
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        title: Text(
          'Calls',
          style: appBarTextStyle,
        ),
      ),
      body: ListView.builder(
        itemCount: callList.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final item = callList[index];
          return  Container(
            width: width,
            height: 90.0,
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(fixPadding),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 60.0,
                        width: 60.0,
                        alignment: Alignment.topRight,
                        padding: EdgeInsets.all(fixPadding),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          image: DecorationImage(
                            image: AssetImage(item['image']!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        width: width - ((fixPadding * 2) + 60.0 + 50.0),
                        padding: EdgeInsets.all(fixPadding),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              item['name']!,
                              style: nemeTextStyle,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            heightSpace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                (item['callStatus'] == 'dial')
                                    ? Icon(Icons.call_made,
                                    color: Colors.blue, size: 16.0)
                                    : (item['callStatus'] == 'received')
                                    ? Icon(Icons.call_received,
                                    color: Colors.orange, size: 16.0)
                                    : Icon(Icons.call_missed,
                                    color: Colors.red, size: 16.0),
                                widthSpace,
                                Text(item['time']!, style: msgTextStyle),
                              ],
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          if (item['type'] == 'voice') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PhoneCall(
                                        name: item['name'],
                                        imagePath: item['image'])));
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        VideoCall(name: item['name'])));
                          }
                        },
                        icon: Icon(
                            (item['type'] == 'voice')
                                ? Icons.call
                                : Icons.videocam,
                            color: primaryColor,
                            size: 18.0),
                      ),
                    ],
                  ),
                ),
                (index != (callList.length - 1))
                    ? Container(
                  width: width - (fixPadding * 2.0),
                  height: 0.6,
                  color: primaryColor.withOpacity(0.20),
                )
                    : Container(),
              ],
            ),
          );


            /*FadeIn(
            1.0,
            Container(
              width: width,
              height: 90.0,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(fixPadding),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 60.0,
                          width: 60.0,
                          alignment: Alignment.topRight,
                          padding: EdgeInsets.all(fixPadding),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            image: DecorationImage(
                              image: AssetImage(item['image']),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          width: width - ((fixPadding * 2) + 60.0 + 50.0),
                          padding: EdgeInsets.all(fixPadding),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                item['name'],
                                style: nemeTextStyle,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              heightSpace,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  (item['callStatus'] == 'dial')
                                      ? Icon(Icons.call_made,
                                          color: Colors.blue, size: 16.0)
                                      : (item['callStatus'] == 'received')
                                          ? Icon(Icons.call_received,
                                              color: Colors.orange, size: 16.0)
                                          : Icon(Icons.call_missed,
                                              color: Colors.red, size: 16.0),
                                  widthSpace,
                                  Text(item['time'], style: msgTextStyle),
                                ],
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            if (item['type'] == 'voice') {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PhoneCall(
                                          name: item['name'],
                                          imagePath: item['image'])));
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          VideoCall(name: item['name'])));
                            }
                          },
                          icon: Icon(
                              (item['type'] == 'voice')
                                  ? Icons.call
                                  : Icons.videocam,
                              color: primaryColor,
                              size: 18.0),
                        ),
                      ],
                    ),
                  ),
                  (index != (callList.length - 1))
                      ? Container(
                          width: width - (fixPadding * 2.0),
                          height: 0.6,
                          color: primaryColor.withOpacity(0.20),
                        )
                      : Container(),
                ],
              ),
            ),
          );*/
        },
      ),
    );
  }
}
