import 'dart:io';

import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/pages/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class NewGroupInfo extends StatefulWidget {
  @override
  _NewGroupInfoState createState() => _NewGroupInfoState();
}

class _NewGroupInfoState extends State<NewGroupInfo> {
  File? _image;
  final picker = ImagePicker();

  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        title: Text(
          'Group info',
          style: appBarTextStyle,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => BottomBar()));
        },
        child: Icon(Icons.arrow_forward),
      ),
      body: ListView(
        children: [
          SizedBox(height: 30.0),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: (_image == null)
                ? InkWell(
                    onTap: () => _bottomSheet(
                        context, MediaQuery.of(context).size.width),
                    child: Container(
                      width: 96.0,
                      height: 96.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(48.0),
                        border: Border.all(width: 0.7, color: primaryColor),
                      ),
                      child: Icon(
                        Icons.add_a_photo,
                        color: primaryColor,
                        size: 30.0,
                      ),
                    ),
                  )
                : InkWell(
                    onTap: () => _bottomSheet(
                        context, MediaQuery.of(context).size.width),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(48.0),
                      child: Container(
                        width: 96.0,
                        height: 96.0,
                        child: Image.file(
                          _image!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
          ),
          heightSpace,
          heightSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
            child: TextField(
              style: TextStyle(
                fontSize: 18.0,
              ),
              decoration: InputDecoration(
                hintText: "Add group name",
                hintStyle: TextStyle(
                  fontSize: 18.0,
                ),
                prefixIcon: Icon(Icons.group),
                fillColor: Colors.white,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(color: primaryColor, width: 1.5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(color: Colors.grey[300]!, width: 1.5),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(color: Colors.grey[300]!, width: 1.5),
                ),
              ),
            ),
          ),
          heightSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
            child: TextField(
              style: TextStyle(
                fontSize: 18.0,
              ),
              decoration: InputDecoration(
                hintText: "Add description",
                hintStyle: TextStyle(
                  fontSize: 18.0,
                ),
                prefixIcon: Icon(Icons.note),
                fillColor: Colors.white,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(color: primaryColor, width: 1.5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(color: Colors.grey[300]!, width: 1.5),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(color: Colors.grey[300]!, width: 1.5),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _bottomSheet(context, width) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        builder: (BuildContext bc) {
          return Container(
            width: width,
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            child: Wrap(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10.0),
                      alignment: Alignment.center,
                      child: Text(
                        'Choose Option',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Divider(),
                    SizedBox(height: 15.0),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        getImageFromCamera();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.camera_alt,
                              size: 22.0,
                              color: Colors.black,
                            ),
                            SizedBox(width: 10.0),
                            Text(
                              'Camera',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 16.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15.0),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        getImageFromGallery();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.photo_album,
                              size: 22.0,
                              color: Colors.black,
                            ),
                            SizedBox(width: 10.0),
                            Text(
                              'Choose from Gallery',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 16.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15.0),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
