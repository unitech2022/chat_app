import 'package:chat_app/animation/fadeIn.dart';
import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/pages/groups/group_message_screen.dart';
import 'package:chat_app/pages/groups/new_group.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Groups extends StatefulWidget {
  @override
  _GroupsState createState() => _GroupsState();
}

class _GroupsState extends State<Groups> {
  final groupList = [
    {
      'name': 'Ellison Family',
      'image': 'assets/group/group1.jpg',
      'time': '5m',
      'user': 'Ronan',
      'msg': 'Hello',
      'msgNumber': '3',
      'type': 'msg'
    },
    {
      'name': 'My Sweet Family',
      'image': 'assets/group/group2.jpg',
      'time': '14m',
      'user': 'Dad',
      'msg': 'Hello Ellison. Where are you?',
      'msgNumber': '1',
      'type': 'msg'
    },
    {
      'name': 'Best Friends Forever',
      'image': 'assets/group/group3.jpg',
      'time': '20m',
      'user': 'John',
      'msg': 'That\'s so funny.',
      'msgNumber': '0',
      'type': 'msg'
    },
    {
      'name': 'Legend\'s Group',
      'image': 'assets/group/group4.jpg',
      'time': '1d',
      'user': 'You',
      'msg': 'Hello',
      'msgNumber': '6',
      'type': 'msg'
    },
    {
      'name': 'Group of Unity',
      'image': 'assets/group/group5.jpg',
      'time': '2d',
      'user': 'You',
      'msg': 'We meet today?',
      'msgNumber': '0',
      'type': 'file'
    },
    {
      'name': 'Diego',
      'image': 'assets/group/group6.jpg',
      'time': '2d',
      'user': 'Peter',
      'msg': 'Hello',
      'msgNumber': '0',
      'type': 'contact'
    },
    {
      'name': 'Ellison Family',
      'image': 'assets/group/group1.jpg',
      'time': '5m',
      'user': 'Ronan',
      'msg': 'Hello',
      'msgNumber': '3',
      'type': 'msg'
    },
    {
      'name': 'My Sweet Family',
      'image': 'assets/group/group2.jpg',
      'time': '14m',
      'user': 'Dad',
      'msg': 'Hello Ellison. Where are you?',
      'msgNumber': '1',
      'type': 'msg'
    },
    {
      'name': 'Best Friends Forever',
      'image': 'assets/group/group3.jpg',
      'time': '20m',
      'user': 'John',
      'msg': 'That\'s so funny.',
      'msgNumber': '0',
      'type': 'msg'
    },
    {
      'name': 'Legend\'s Group',
      'image': 'assets/group/group4.jpg',
      'time': '1d',
      'user': 'You',
      'msg': 'Hello',
      'msgNumber': '6',
      'type': 'msg'
    },
    {
      'name': 'Group of Unity',
      'image': 'assets/group/group5.jpg',
      'time': '2d',
      'user': 'You',
      'msg': 'We meet today?',
      'msgNumber': '0',
      'type': 'file'
    },
    {
      'name': 'Diego',
      'image': 'assets/group/group6.jpg',
      'time': '2d',
      'user': 'Peter',
      'msg': 'Hello',
      'msgNumber': '0',
      'type': 'contact'
    },
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        title: Text(
          'Groups',
          style: appBarTextStyle,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: whiteColor),
            onPressed: () {},
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.group_add,
          color: whiteColor,
        ),
        onPressed: () {
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.rightToLeft, child: NewGroup()));
        },
      ),
      body: ListView.builder(
        itemCount: groupList.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final item = groupList[index];
          return  InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => GroupMessageScreen(
                          name: item['name'], imagePath: item['image'])));
            },
            child: Container(
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
                        InkWell(
                          onTap: () {},
                          child: Container(
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
                        ),
                        Container(
                          width: width - ((fixPadding * 2) + 60.0 + 30.0),
                          padding: EdgeInsets.all(fixPadding),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    item['name']!,
                                    style: nemeTextStyle,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  widthSpace,
                                  Text(
                                    item['time']!,
                                    style: timeTextStyle,
                                  ),
                                ],
                              ),
                              heightSpace,
                              (item['type'] == 'msg')
                                  ? Text(
                                '${item['user']}: ${item['msg']}',
                                style: msgTextStyle,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              )
                                  : (item['type'] == 'file')
                                  ? Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.attach_file,
                                    color: greyColor,
                                    size: 16.0,
                                  ),
                                  SizedBox(width: 3.0),
                                  Text(
                                    '${item['user']} share a file',
                                    style: msgTextStyle,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ],
                              )
                                  : Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.contacts,
                                    color: greyColor,
                                    size: 16.0,
                                  ),
                                  SizedBox(width: 3.0),
                                  Text(
                                    '${item['user']} share a contact',
                                    style: msgTextStyle,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        (item['msgNumber'] != '0')
                            ? Container(
                          height: 20.0,
                          width: 20.0,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Text(
                            item['msgNumber']!,
                            style: badgeTextStyle,
                          ),
                        )
                            : Container(),
                      ],
                    ),
                  ),
                  (index != (groupList.length - 1))
                      ? Container(
                    width: width - (fixPadding * 2.0),
                    height: 0.6,
                    color: primaryColor.withOpacity(0.20),
                  )
                      : Container(),
                ],
              ),
            ),
          );

           /* FadeIn(
            1.0,
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GroupMessageScreen(
                            name: item['name'], imagePath: item['image'])));
              },
              child: Container(
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
                          InkWell(
                            onTap: () {},
                            child: Container(
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
                          ),
                          Container(
                            width: width - ((fixPadding * 2) + 60.0 + 30.0),
                            padding: EdgeInsets.all(fixPadding),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      item['name'],
                                      style: nemeTextStyle,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    widthSpace,
                                    Text(
                                      item['time'],
                                      style: timeTextStyle,
                                    ),
                                  ],
                                ),
                                heightSpace,
                                (item['type'] == 'msg')
                                    ? Text(
                                        '${item['user']}: ${item['msg']}',
                                        style: msgTextStyle,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      )
                                    : (item['type'] == 'file')
                                        ? Row(
                                            children: <Widget>[
                                              Icon(
                                                Icons.attach_file,
                                                color: greyColor,
                                                size: 16.0,
                                              ),
                                              SizedBox(width: 3.0),
                                              Text(
                                                '${item['user']} share a file',
                                                style: msgTextStyle,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              )
                                            ],
                                          )
                                        : Row(
                                            children: <Widget>[
                                              Icon(
                                                Icons.contacts,
                                                color: greyColor,
                                                size: 16.0,
                                              ),
                                              SizedBox(width: 3.0),
                                              Text(
                                                '${item['user']} share a contact',
                                                style: msgTextStyle,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              )
                                            ],
                                          ),
                              ],
                            ),
                          ),
                          (item['msgNumber'] != '0')
                              ? Container(
                                  height: 20.0,
                                  width: 20.0,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Text(
                                    item['msgNumber'],
                                    style: badgeTextStyle,
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    ),
                    (index != (groupList.length - 1))
                        ? Container(
                            width: width - (fixPadding * 2.0),
                            height: 0.6,
                            color: primaryColor.withOpacity(0.20),
                          )
                        : Container(),
                  ],
                ),
              ),
            ),
          );*/
        },
      ),
    );
  }
}
