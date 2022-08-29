import 'package:chat_app/constants/constants.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  String name = 'Ellison Perry';
  String about =
      'Push yourself, because no one else is going to do it for you.';

  var nameController = TextEditingController();
  var aboutController = TextEditingController();

  @override
  void initState() {
    nameController.text = name;
    aboutController.text = about;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        title: Text(
          'Profile',
          style: appBarTextStyle,
        ),
      ),
      body: ListView(
        children: [
          profileImage(),
          nameTile(),
          heightSpace,
          heightSpace,
          divider(),
          heightSpace,
          heightSpace,
          aboutTile(),
          heightSpace,
          heightSpace,
          divider(),
          heightSpace,
          heightSpace,
          phoneTile(),
          heightSpace,
          heightSpace,
        ],
      ),
    );
  }

  profileImage() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(fixPadding * 2.0),
      alignment: Alignment.center,
      child: Container(
        width: 130.0,
        height: 130.0,
        child: Stack(
          children: [
            Material(
              borderRadius: BorderRadius.circular(65.0),
              elevation: 1.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(65.0),
                child: Hero(
                  tag: 'profile image',
                  child: Image.asset(
                    'assets/user_profile/user_3.jpg',
                    width: 130.0,
                    height: 130.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0.0,
              bottom: 0.0,
              child: InkWell(
                onTap: () => _imageUploadOptionModalBottomSheet(context),
                child: Material(
                  borderRadius: BorderRadius.circular(22.0),
                  elevation: 2.0,
                  child: Container(
                    width: 44.0,
                    height: 44.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22.0),
                      color: primaryColor,
                    ),
                    child: Icon(
                      Icons.camera_alt,
                      color: whiteColor,
                      size: 20.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  nameTile() {
    return InkWell(
      onTap: () => _changeNameBottomSheet(context),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person,
                    color: greyColor,
                    size: 24.0,
                  ),
                  widthSpace,
                  widthSpace,
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name',
                              style: greySmallTextStyle,
                            ),
                            SizedBox(height: 3.0),
                            Text(
                              name,
                              style: blackNormalTextStyle,
                            ),
                          ],
                        ),
                        Icon(
                          Icons.edit,
                          color: greyColor.withOpacity(0.7),
                          size: 19.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            heightSpace,
            Padding(
              padding: EdgeInsets.only(
                  left: (fixPadding * 4.0 + 24.0), right: fixPadding * 2.0),
              child: Text(
                'This is not your username or pin. This name will be visible to your ChatApp contacts.',
                style: greySmallTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }

  aboutTile() {
    return InkWell(
      onTap: () => _changeAboutBottomSheet(context),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.info_outline,
              color: greyColor,
              size: 24.0,
            ),
            widthSpace,
            widthSpace,
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'About',
                          style: greySmallTextStyle,
                        ),
                        SizedBox(height: 3.0),
                        Padding(
                          padding: EdgeInsets.only(right: 5.0),
                          child: Text(
                            about,
                            style: blackNormalTextStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.edit,
                    color: greyColor.withOpacity(0.7),
                    size: 19.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  phoneTile() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.phone,
            color: greyColor,
            size: 24.0,
          ),
          widthSpace,
          widthSpace,
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Phone',
                        style: greySmallTextStyle,
                      ),
                      SizedBox(height: 3.0),
                      Text(
                        '+1 12345678',
                        style: blackNormalTextStyle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  divider() {
    return Container(
      height: 0.7,
      width: double.infinity,
      margin: EdgeInsets.only(left: (fixPadding * 4.0 + 24.0)),
      color: greyColor.withOpacity(0.2),
    );
  }

  // Bottom Sheet for Image Upload Options Starts Here
  void _imageUploadOptionModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext bc) {
          return Wrap(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(fixPadding * 2.0),
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(5.0)),
                  color: whiteColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Profile photo',
                      style: blackHeadingTextStyle,
                    ),
                    heightSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            width: 90.0,
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 50.0,
                                  height: 50.0,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25.0),
                                    color: Colors.red,
                                  ),
                                  child: Icon(
                                    Icons.delete,
                                    color: whiteColor,
                                    size: 22.0,
                                  ),
                                ),
                                heightSpace,
                                Text(
                                  'Remove photo',
                                  style: greyNormalTextStyle,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                        widthSpace,
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            width: 90.0,
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 50.0,
                                  height: 50.0,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25.0),
                                    color: Colors.blue,
                                  ),
                                  child: Icon(
                                    Icons.photo_album_rounded,
                                    color: whiteColor,
                                    size: 22.0,
                                  ),
                                ),
                                heightSpace,
                                Text(
                                  'Gallery',
                                  style: greyNormalTextStyle,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                        widthSpace,
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            width: 90.0,
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 50.0,
                                  height: 50.0,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25.0),
                                    color: Colors.orange,
                                  ),
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: whiteColor,
                                    size: 22.0,
                                  ),
                                ),
                                heightSpace,
                                Text(
                                  'Camera',
                                  style: greyNormalTextStyle,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }
  // Bottom Sheet for Image Upload Options Ends Here

  // Change Name Bottom Sheet Start
  void _changeNameBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (BuildContext bc) {
          return Wrap(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(fixPadding * 2.0,
                      fixPadding * 2.0, fixPadding * 2.0, fixPadding),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(5.0)),
                    color: whiteColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Enter your name',
                        style: blackHeadingTextStyle,
                      ),
                      heightSpace,
                      TextField(
                        controller: nameController,
                        style: TextStyle(fontSize: 15.0),
                        decoration: InputDecoration(
                          hintText: 'Enter your name',
                          hintStyle: TextStyle(
                            color: Colors.grey[300],
                            fontSize: 15.0,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey[300]!, width: 1.5),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: primaryColor, width: 1.5),
                          ),
                          border: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: primaryColor, width: 1.5),
                          ),
                        ),
                      ),
                      heightSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () => Navigator.pop(context),
                            borderRadius: BorderRadius.circular(5.0),
                            child: Container(
                              padding:
                                  EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                name = nameController.text;
                                Navigator.pop(context);
                              });
                            },
                            borderRadius: BorderRadius.circular(5.0),
                            child: Container(
                              padding:
                                  EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                              child: Text(
                                'Save',
                                style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }
  // Change Name Bottom Sheet End

  // Change About Bottom Sheet Start
  void _changeAboutBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (BuildContext bc) {
          return Wrap(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(fixPadding * 2.0,
                      fixPadding * 2.0, fixPadding * 2.0, fixPadding),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(5.0)),
                    color: whiteColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'About',
                        style: blackHeadingTextStyle,
                      ),
                      heightSpace,
                      TextField(
                        controller: aboutController,
                        style: TextStyle(fontSize: 15.0),
                        decoration: InputDecoration(
                          hintText: 'About',
                          hintStyle: TextStyle(
                            color: Colors.grey[300],
                            fontSize: 15.0,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey[300]!, width: 1.5),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: primaryColor, width: 1.5),
                          ),
                          border: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: primaryColor, width: 1.5),
                          ),
                        ),
                      ),
                      heightSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () => Navigator.pop(context),
                            borderRadius: BorderRadius.circular(5.0),
                            child: Container(
                              padding:
                                  EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                about = aboutController.text;
                                Navigator.pop(context);
                              });
                            },
                            borderRadius: BorderRadius.circular(5.0),
                            child: Container(
                              padding:
                                  EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                              child: Text(
                                'Save',
                                style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }
  // Change About Bottom Sheet End
}
