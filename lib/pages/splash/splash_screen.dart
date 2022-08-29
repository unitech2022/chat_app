import 'dart:async';

import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/helpers/constants.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../helpers/functions.dart';
import '../auth/create_account.dart';
import '../auth/onboarding.dart';
import '../bottom_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  startTime() async {
    var _duration = const Duration(milliseconds: 3000);

    return Timer(_duration, () {
      navigationPage();
      // init();
    });
  }

  Future<void> navigationPage() async {
    await readToken();

    if (isRegistered()) {
      replacePage(context: context, page:  BottomBar());
    } else {
      replacePage(context: context, page:  OnBoarding());
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // context.read<AddsProviders>().getSubCategoreisAdds();
      FirebaseMessaging.instance.getToken().then((value) {
        tokenFCM = value!;
        print("tokkkkkkkkkken:$tokenFCM");
      });
      // Add Your Code here.
    });
    startTime();


  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: primaryColor,
        ),
      ),
    );
  }
}
