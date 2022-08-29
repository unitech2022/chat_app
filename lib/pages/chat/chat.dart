import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/animation/fadeIn.dart';
import 'package:chat_app/bloc/rooms_cubit/rooms_cubit.dart';
import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/helpers/constants.dart';
import 'package:chat_app/pages/chat/message_screen.dart';
import 'package:chat_app/pages/chat/profile.dart';
import 'package:chat_app/pages/chat/select_contact.dart';
import 'package:chat_app/pages/phone_call.dart';
import 'package:chat_app/pages/video_call.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final chatList = [
    {
      'name': 'Ronan',
      'image': 'assets/user_profile/user_1.jpg',
      'time': '5m',
      'msg': 'Hello',
      'msgNumber': '3',
      'type': 'msg'
    },
    {
      'name': 'Brayden',
      'image': 'assets/user_profile/user_2.jpg',
      'time': '14m',
      'msg': 'Hello',
      'msgNumber': '8',
      'type': 'file'
    },
    {
      'name': 'Apollonia',
      'image': 'assets/user_profile/user_3.jpg',
      'time': '20m',
      'msg': 'Hello',
      'msgNumber': '0',
      'type': 'contact'
    },
    {
      'name': 'Beatriz',
      'image': 'assets/user_profile/user_4.jpg',
      'time': '1d',
      'msg': 'Hello',
      'msgNumber': '6',
      'type': 'msg'
    },
    {
      'name': 'Shira',
      'image': 'assets/user_profile/user_5.jpg',
      'time': '2d',
      'msg': 'Hello',
      'msgNumber': '0',
      'type': 'file'
    },
    {
      'name': 'Diego',
      'image': 'assets/user_profile/user_6.jpg',
      'time': '2d',
      'msg': 'Hello',
      'msgNumber': '0',
      'type': 'contact'
    },
    {
      'name': 'Marco',
      'image': 'assets/user_profile/user_7.jpg',
      'time': '2d',
      'msg': 'Hello',
      'msgNumber': '0',
      'type': 'file'
    },
    {
      'name': 'Steffan',
      'image': 'assets/user_profile/user_8.jpg',
      'time': '2d',
      'msg': 'Hello',
      'msgNumber': '2',
      'type': 'contact'
    }
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    RoomsCubit.get(context).getRooms(context: context, userId: currentUser.id);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    /*showProfileImage(String? name, String? imagePath) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return Hero(
            tag: imagePath!,
            child: Dialog(
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              child: Wrap(
                children: <Widget>[
                  Column(
                    children: [
                      Stack(
                        children: <Widget>[
                          Container(
                            width: width,
                            height: 220.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(5.0),
                                topLeft: Radius.circular(5.0),
                              ),
                              image: DecorationImage(
                                  image: AssetImage(imagePath),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Positioned(
                            top: 0.0,
                            child: Container(
                              width: width,
                              height: 30.0,
                              padding: EdgeInsets.only(left: fixPadding),
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(5.0),
                                  topLeft: Radius.circular(5.0),
                                ),
                                color: blackColor.withOpacity(0.6),
                              ),
                              child: Text(
                                name!,
                                style: appBarTextStyle,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(fixPadding),
                        width: width,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5.0),
                            bottomRight: Radius.circular(5.0),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.chat,
                                  color: primaryColor, size: 18.0),
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MessageScreen(
                                            sender: ,)));
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.call,
                                  color: primaryColor, size: 18.0),
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PhoneCall(
                                            name: name, imagePath: imagePath)));
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.videocam,
                                  color: primaryColor, size: 18.0),
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            VideoCall(name: name)));
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.info_outline,
                                  color: primaryColor, size: 18.0),
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Profile(
                                      userName: name,
                                      userImage: imagePath,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    }*/

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        title: Text(
          'Chat',
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
          Icons.message_outlined,
          color: whiteColor,
        ),
        onPressed: () {
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.rightToLeft,
                  child: SelectContact()));
        },
      ),
      body: BlocConsumer<RoomsCubit, RoomsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return RoomsCubit.get(context).loadingRooms
              ? Center(
                  child: CircularProgressIndicator(
                    color: primaryColor,
                    strokeWidth: 3,
                  ),
                )
              : ListView.builder(
                  itemCount: RoomsCubit.get(context).roomModel!.items!.length,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final item = RoomsCubit.get(context).roomModel!.items![index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MessageScreen(sender: item.sender,)));
                      },
                      child: Container(
                        width: width,
                        height: 95.0,
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
                                  Hero(
                                    tag: "${item.room!.id}",
                                    child: InkWell(
                                      onTap: () {
                                        // showProfileImage(
                                        //     item['name'], item['image']);
                                      },
                                      child: Container(
                                        height: 60.0,
                                        width: 60.0,
                                        alignment: Alignment.topRight,
                                        padding: EdgeInsets.all(fixPadding),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          border: Border.all(color: Colors.grey.withOpacity(.5),width: 1),
                                        ),
                                        child:   ClipRRect(
                                          borderRadius: BorderRadius.circular(50),
                                          child: CachedNetworkImage(
                                            imageUrl: item.sender!.imageUrl !=null?baseurlImage+item.sender!.imageUrl!:"",
                                            height: 60,
                                            width: 60,
                                            fit: BoxFit.fill,
                                            placeholder: (context, url) =>  Padding(
                                              padding: EdgeInsets.all(10.0),
                                              child: CircularProgressIndicator(
                                                color: primaryColor,
                                              ),
                                            ),
                                            errorWidget: (context, url, error) =>
                                            const Icon(Icons.person,size: 40,color: Colors.grey,),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: width -
                                        ((fixPadding * 2) + 60.0 + 30.0),
                                    padding: EdgeInsets.all(fixPadding),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              item.sender!=null?item.sender!.fullName!:"",
                                              style: nemeTextStyle,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            widthSpace,
                                            Text(
                                              item.sender!=null?item.room!.createdAt!.split("T")[0]:"",
                                              style: timeTextStyle,
                                            ),
                                          ],
                                        ),
                                        heightSpace,
                                        Text(
                                          item.room!.message!,
                                          style: msgTextStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        )
                                        /*(item['type'] == 'msg')
                                            ? Text(
                                                item['msg']!,
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
                                                        'You share a file',
                                                        style: msgTextStyle,
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
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
                                                        'You share a contact',
                                                        style: msgTextStyle,
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      )
                                                    ],
                                                  ),*/
                                      ],
                                    ),
                                  ),
                                  Container(
                                          height: 20.0,
                                          width: 20.0,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: Text(
                                            "5",
                                            style: badgeTextStyle,
                                          ),
                                        )

                                ],
                              ),
                            ),
                            (index != (chatList.length - 1))
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
                        builder: (context) => MessageScreen(
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
                          Hero(
                            tag: item['image'],
                            child: InkWell(
                              onTap: () {
                                showProfileImage(item['name'], item['image']);
                              },
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
                                        item['msg'],
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
                                                'You share a file',
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
                                                'You share a contact',
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
                    (index != (chatList.length - 1))
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
                );
        },
      ),
    );
  }
}
