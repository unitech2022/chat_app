import 'dart:ui';

import 'package:chat_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PhoneCall extends StatefulWidget {
  final String? name;
  final String? imagePath;
  PhoneCall({Key? key, required this.name, required this.imagePath})
      : super(key: key);

  @override
  _PhoneCallState createState() => _PhoneCallState();
}

class _PhoneCallState extends State<PhoneCall> {
  bool mute = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            image: DecorationImage(
              // image: AssetImage('assets/chat_bg.jpg'),
              image: AssetImage(widget.imagePath!),
              fit: BoxFit.cover,
            ),
          ),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: Colors.grey.shade200.withOpacity(0.1),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: width - fixPadding * 2.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: (100.0)),
                        Stack(
                          children: <Widget>[
                            Container(
                              height: 200.0,
                              width: 200.0,
                              child: SpinKitRipple(
                                color: whiteColor.withOpacity(0.6),
                                size: 200.0,
                              ),
                            ),
                            Positioned(
                              top: 50.0,
                              left: 50.0,
                              child: Container(
                                height: 100.0,
                                width: 100.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.0),
                                  image: DecorationImage(
                                    image: AssetImage(widget.imagePath!),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(widget.name!, style: phoneCallNameTextStyle),
                      ],
                    ),
                  ),
                  Container(
                    color: blackColor.withOpacity(0.05),
                    padding: EdgeInsets.all(fixPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            (mute) ? Icons.volume_off : Icons.volume_up,
                            size: 25.0,
                            color: whiteColor,
                          ),
                          onPressed: () {
                            setState(() {
                              mute = !mute;
                            });
                          },
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 56.0,
                            height: 56.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(28.0),
                              color: Colors.red,
                            ),
                            child: Icon(Icons.call_end,
                                color: whiteColor, size: 25.0),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: fixPadding),
                          child: Text(
                            '4:08',
                            style: badgeTextStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
