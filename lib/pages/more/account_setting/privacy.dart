import 'package:chat_app/constants/constants.dart';
import 'package:flutter/material.dart';

class PrivacySetting extends StatefulWidget {
  @override
  _PrivacySettingState createState() => _PrivacySettingState();
}

class _PrivacySettingState extends State<PrivacySetting> {
  String lastSeen = 'Everyone';
  String profilePhoto = 'Everyone';
  String about = 'Everyone';
  bool readReceipt = true;

  lastSeenDialogue() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
          child: Wrap(
            children: [
              Container(
                padding: EdgeInsets.all(fixPadding * 2.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Last seen',
                      style: blackHeadingTextStyle,
                    ),
                    heightSpace,
                    heightSpace,
                    lastSeenDialogTile('Everyone'),
                    heightSpace,
                    lastSeenDialogTile('My contacts'),
                    heightSpace,
                    lastSeenDialogTile('Nobody'),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  lastSeenDialogTile(String status) {
    return InkWell(
      onTap: () {
        setState(() {
          lastSeen = status;
        });
        Navigator.pop(context);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 20.0,
            height: 20.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: whiteColor,
              border: Border.all(width: 2.0, color: primaryColor),
            ),
            child: (lastSeen == status)
                ? Container(
                    width: 10.0,
                    height: 10.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: primaryColor,
                    ),
                  )
                : Container(),
          ),
          widthSpace,
          Text(
            status,
            style: blackNormalTextStyle,
          ),
        ],
      ),
    );
  }

  profilePhotoDialogue() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
          child: Wrap(
            children: [
              Container(
                padding: EdgeInsets.all(fixPadding * 2.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Profile photo',
                      style: blackHeadingTextStyle,
                    ),
                    heightSpace,
                    heightSpace,
                    profilePhotoDialogTile('Everyone'),
                    heightSpace,
                    profilePhotoDialogTile('My contacts'),
                    heightSpace,
                    profilePhotoDialogTile('Nobody'),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  profilePhotoDialogTile(String status) {
    return InkWell(
      onTap: () {
        setState(() {
          profilePhoto = status;
        });
        Navigator.pop(context);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 20.0,
            height: 20.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: whiteColor,
              border: Border.all(width: 2.0, color: primaryColor),
            ),
            child: (profilePhoto == status)
                ? Container(
                    width: 10.0,
                    height: 10.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: primaryColor,
                    ),
                  )
                : Container(),
          ),
          widthSpace,
          Text(
            status,
            style: blackNormalTextStyle,
          ),
        ],
      ),
    );
  }

  aboutPhotoDialogue() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
          child: Wrap(
            children: [
              Container(
                padding: EdgeInsets.all(fixPadding * 2.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About',
                      style: blackHeadingTextStyle,
                    ),
                    heightSpace,
                    heightSpace,
                    aboutDialogTile('Everyone'),
                    heightSpace,
                    aboutDialogTile('My contacts'),
                    heightSpace,
                    aboutDialogTile('Nobody'),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  aboutDialogTile(String status) {
    return InkWell(
      onTap: () {
        setState(() {
          about = status;
        });
        Navigator.pop(context);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 20.0,
            height: 20.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: whiteColor,
              border: Border.all(width: 2.0, color: primaryColor),
            ),
            child: (about == status)
                ? Container(
                    width: 10.0,
                    height: 10.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: primaryColor,
                    ),
                  )
                : Container(),
          ),
          widthSpace,
          Text(
            status,
            style: blackNormalTextStyle,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        title: Text(
          'Privacy',
          style: appBarTextStyle,
        ),
      ),
      body: ListView(
        children: [
          personalInfo(),
          divider(),
        ],
      ),
    );
  }

  personalInfo() {
    return Padding(
      padding: EdgeInsets.fromLTRB(fixPadding * 2.0, fixPadding * 2.0,
          fixPadding * 2.0, fixPadding * 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Who can see my personal info',
            style: primaryColorNormalTextStyle,
          ),
          heightSpace,
          Text(
            'If you don\'t share your Last Seen, you won\'t be able to see other people\'s Last Seen',
            style: blackSmallTextStyle,
          ),
          heightSpace,
          heightSpace,
          InkWell(
            onTap: () {
              lastSeenDialogue();
            },
            child: Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Last seen',
                    style: blackNormalTextStyle,
                  ),
                  SizedBox(height: 3.0),
                  Text(
                    lastSeen,
                    style: greyNormalTextStyle,
                  ),
                ],
              ),
            ),
          ),
          heightSpace,
          heightSpace,
          InkWell(
            onTap: () {
              profilePhotoDialogue();
            },
            child: Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Profile photo',
                    style: blackNormalTextStyle,
                  ),
                  SizedBox(height: 3.0),
                  Text(
                    profilePhoto,
                    style: greyNormalTextStyle,
                  ),
                ],
              ),
            ),
          ),
          heightSpace,
          heightSpace,
          InkWell(
            onTap: () {
              aboutPhotoDialogue();
            },
            child: Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About',
                    style: blackNormalTextStyle,
                  ),
                  SizedBox(height: 3.0),
                  Text(
                    about,
                    style: greyNormalTextStyle,
                  ),
                ],
              ),
            ),
          ),
          heightSpace,
          heightSpace,
          InkWell(
            onTap: () {
              setState(() {
                readReceipt = !readReceipt;
              });
            },
            child: Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Read receipts',
                          style: blackNormalTextStyle,
                        ),
                        SizedBox(height: 3.0),
                        Text(
                          'If turned off, you won\'t send or receive Read receipts. Read receipts are always sent for group chats.',
                          style: greySmallTextStyle,
                        ),
                      ],
                    ),
                  ),
                  Switch(
                    value: readReceipt,
                    onChanged: (value) {
                      setState(() {
                        readReceipt = value;
                      });
                    },
                    activeTrackColor: primaryColor.withOpacity(0.4),
                    activeColor: primaryColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  divider() {
    return Container(
      width: double.infinity,
      height: 0.7,
      color: greyColor.withOpacity(0.2),
    );
  }
}
