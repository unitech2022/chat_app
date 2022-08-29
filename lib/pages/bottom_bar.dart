import 'dart:io';

import 'package:chat_app/bloc/auth_cubit/auth_cubit.dart';
import 'package:chat_app/bloc/message_cubit/message_cubit.dart';
import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/helpers/constants.dart';
import 'package:chat_app/pages/calls/calls.dart';
import 'package:chat_app/pages/chat/chat.dart';
import 'package:chat_app/pages/groups/groups.dart';
import 'package:chat_app/pages/more/more.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../helpers/local_notification.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int? currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
    AuthCubit.get(context).updateDeviceToken(
      userId: currentUser.id!,
      context: context,
      token: tokenFCM
    );

    getNotification();
  }

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: StyleProvider(
        style: Style(),
        child: ConvexAppBar(
          items: [
            TabItem(icon: Icons.chat_bubble_outline, title: 'Chat'),
            TabItem(icon: Icons.call, title: 'Calls'),
            TabItem(icon: Icons.group, title: 'Groups'),
            TabItem(icon: Icons.more_horiz, title: 'More'),
          ],
          initialActiveIndex: currentIndex,
          height: 50,
          top: -30,
          curveSize: 100,
          curve: Curves.easeInCirc,
          onTap: (int i) => changePage(i),
          backgroundColor: primaryColor,
          elevation: 0.0,
        ),
      ),
      body: WillPopScope(
        child: (currentIndex == 0)
            ? Chat()
            : (currentIndex == 1)
                ? Calls()
                : (currentIndex == 2)
                    ? Groups()
                    : More(),
        onWillPop: () async {
          bool exitStatus = onWillPop();
          if (exitStatus) {
            exit(0);
          }
          return false;
        },
      ),
    );
  }

  onWillPop() {
    return true;
  }

  void getNotification() {

    FirebaseMessaging.onMessage.listen((RemoteMessage? message) {
      RemoteNotification notification = message!.notification!;
      AndroidNotification android = message.notification!.android!;
      // NotifyAowsome(notification!.title!,notification.body!);
      if (notification != null && android != null && !kIsWeb) {
        print("mmmmmmmmmmmmmmmmmmm"+message.data["senderId"]);

        MessageCubit.get(context).getMessages(senderId:message.data["senderId"],
        status:1,page: 1);
        NotificationApi.showNotification(
            id: 0,
            title:notification.title,
            body:notification.body

        );

/*
      AwesomeNotifications().createNotification(

          content: NotificationContent(
            id: createUniqueId(),
            color: mainColor,
           icon: 'resource://drawable/logo',

            channelKey: 'key1',
            title:tr(notification.title),
            // notification.title,
            body: tr(notification.body),


            // largeIcon: "asset://assets/images/logo_final.png"
          ));*/



        // print("aaaaaaaaaaaawww${");
      }


    });

  }
}

class Style extends StyleHook {
  @override
  double get activeIconSize => 30;

  @override
  double get activeIconMargin => 15;

  @override
  double get iconSize => 20;

  @override
  TextStyle textStyle(Color color) {
    return TextStyle(fontSize: 10.0, color: Colors.white);
  }
}
