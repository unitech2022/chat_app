import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/animation/fadeUp.dart';
import 'package:chat_app/bloc/message_cubit/message_cubit.dart';
import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/helpers/functions.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/pages/bottom_bar.dart';
import 'package:chat_app/pages/chat/full_screen_image.dart';
import 'package:chat_app/pages/chat/profile.dart';
import 'package:chat_app/pages/phone_call.dart';
import 'package:chat_app/pages/video_call.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../helpers/constants.dart';
import '../../models/user_model.dart';
import 'audio_item.dart';

class MessageScreen extends StatefulWidget {
  final UserModel? sender;

  MessageScreen({
    required this.sender,
  });

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final msgController = TextEditingController();
  DateTime now = DateTime.now();
  ScrollController _scrollController = new ScrollController();
  String? amPm;


  static List<String> choices = <String>['Report', 'Block'];

  @override
  void initState() {
    super.initState();
    _scrollToBottom();
    print(widget.sender!.id);

    MessageCubit.get(context)
        .getMessages(page: 1, senderId: widget.sender!.id!);
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(0.0,
          duration: Duration(milliseconds: 300), curve: Curves.elasticOut);
    } else {
      Timer(Duration(milliseconds: 400), () => _scrollToBottom());
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocConsumer<MessageCubit, MessageState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Stack(
          children: <Widget>[
            Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/chat_bg.jpg'),
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
                  appBar: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0.0,
                    leading: IconButton(
                      icon: Icon(Icons.arrow_back_ios, color: whiteColor),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BottomBar()));
                      },
                    ),
                    titleSpacing: 0.0,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            /*   Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Profile(
                              userName: widget.sender!.fullName!,
                              userImage: widget.imagePath,
                            ),
                          ),
                        );*/
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 45.0,
                                width: 45.0,

                                alignment: Alignment.topRight,

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0),

                                  border: Border.all(
                                      color: Colors.grey.withOpacity(.5),
                                      width: 1),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: CachedNetworkImage(
                                    imageUrl: widget.sender!.imageUrl != null
                                        ? baseurlImage +
                                            widget.sender!.imageUrl!
                                        : "",
                                    height: 45,
                                    width: 45,
                                    fit: BoxFit.fill,
                                    placeholder: (context, url) => Padding(
                                      padding: EdgeInsets.all(0.0),
                                      child: CircularProgressIndicator(
                                        color: primaryColor,
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Center(
                                          child: const Icon(
                                      Icons.person,
                                      size: 30,
                                      color: Colors.grey,
                                    ),
                                        ),
                                  ),
                                ),
                              ),
                              widthSpace,
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    widget.sender!.fullName!,
                                    style: msgScreenNameTextStyle,
                                  ),
                                  Text(
                                    'Online',
                                    style: msgScreenOnlineTextStyle,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.call, color: whiteColor),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PhoneCall(
                                              name: widget.sender!.fullName!,
                                              imagePath:
                                                  widget.sender!.imageUrl,
                                            )));
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.videocam, color: whiteColor),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => VideoCall(
                                              name: widget.sender!.fullName!,
                                            )));
                              },
                            ),
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
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  body: MessageCubit.get(context).getMessagesLoad
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 3,
                          ),
                        )
                      : body(),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  body() {
    double width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            controller: _scrollController,
            itemCount: MessageCubit.get(context).messageResponse!.items!.length,
            reverse: true,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final item =
                  MessageCubit.get(context).messageResponse!.items![index];
              return Container(
                width: width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: (item.typeSender == 'sender')
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.end,
                  children: <Widget>[
                    Wrap(
                      children: <Widget>[
                        Padding(
                          padding: (item.typeSender == 'sender')
                              ? EdgeInsets.only(right: 100.0)
                              : EdgeInsets.only(left: 100.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: (item.typeSender == 'sender')
                                ? CrossAxisAlignment.start
                                : CrossAxisAlignment.end,
                            children: <Widget>[
                              getTypeMessage(item: item)
                             /* (item.type == 'text')
                                  ? Container(
                                      padding: EdgeInsets.all(10.0),
                                      margin: EdgeInsets.only(
                                          left: 10.0, right: 10.0),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        color: (item.typeSender == 'sender')
                                            ? Colors.white
                                            : primaryColor,
                                      ),
                                      child: Text(
                                        item.messageText!,
                                        style: TextStyle(
                                          color: (item.typeSender == 'sender')
                                              ? primaryColor
                                              : Colors.white,
                                          fontSize: 15.0,
                                        ),
                                      ),
                                    )
                                  : (item.type == 'image')
                                      ? InkWell(
                                          onTap: () {
                                            *//* Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        FullScreenImage(
                                                          imagePath:
                                                              item['image'],
                                                        )));*//*
                                          },
                                          child: Hero(
                                            tag: item.messageText!,
                                            child: Container(
                                              width: 150.0,
                                              height: 150.0,
                                              margin: EdgeInsets.only(
                                                  left: 10.0, right: 10.0),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                                border: Border.all(
                                                    width: 2.0,
                                                    color: whiteColor),
                                              ),
                                              child: ClipRRect(
                                                child: item.status == 0
                                                    ? Image.file(
                                                        File(item.messageText!),
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        fit: BoxFit.cover,
                                                      )
                                                    : Image.network(
                                                       baseurlImage+ item.messageText!,
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        fit: BoxFit.cover,
                                                      ),
                                              ),
                                            ),
                                          ),
                                        )
                                      : SizedBox()*/
                              // : Container(
                              //       padding: EdgeInsets.all(10.0),
                              //       margin: EdgeInsets.only(
                              //           left: 10.0, right: 10.0),
                              //       decoration: BoxDecoration(
                              //         borderRadius:
                              //             BorderRadius.circular(5.0),
                              //         color: (item.typeSender == 'sender')
                              //             ? Colors.white
                              //             : primaryColor,
                              //       ),
                              //       child: Row(
                              //         mainAxisSize: MainAxisSize.min,
                              //         mainAxisAlignment:
                              //             (item.typeSender == 'sender')
                              //                 ? MainAxisAlignment.start
                              //                 : MainAxisAlignment.end,
                              //         crossAxisAlignment:
                              //             CrossAxisAlignment.center,
                              //         children: <Widget>[
                              //           Icon(
                              //             Icons.group_add,
                              //             color:
                              //                 (item.typeSender == 'sender')
                              //                     ? primaryColor
                              //                     : Colors.white,
                              //           ),
                              //           SizedBox(width: 10.0),
                              //           Container(
                              //             height: 8.0,
                              //             width: 0.7,
                              //             color:
                              //                 (item.typeSender == 'sender')
                              //                     ? primaryColor
                              //                     : Colors.white,
                              //           ),
                              //           SizedBox(width: 10.0),
                              //           Text(
                              //             item['contactName']!,
                              //             style: TextStyle(
                              //               color:
                              //                   (item.typeSender == 'sender')
                              //                       ? primaryColor
                              //                       : Colors.white,
                              //               fontSize: 15.0,
                              //             ),
                              //           ),
                              //         ],
                              //       ),
                              //     ),
                              ,
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      (item.typeSender == 'sender')
                                          ? MainAxisAlignment.start
                                          : MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    (item.typeSender == 'sender')
                                        ? Container()
                                        : Icon(
                                            (item.status == 1)
                                                ? Icons.done_all
                                                : Icons.check,
                                            color: Colors.white38,
                                            size: 16.0,
                                          ),
                                    SizedBox(
                                      width: 7.0,
                                    ),
                                    Text(
                                      item.createdAt!.split("T")[0],
                                      style: TextStyle(
                                        color: Colors.white38,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Container(
          width: width,
          height: 70.0,
          padding: EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: width - 120.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white.withOpacity(0.2),
                ),
                child: TextField(
                  controller: msgController,
                  style: TextStyle(
                    fontSize: 13.0,
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Type a Message',
                    hintStyle: TextStyle(
                      fontSize: 13.0,
                      color: Colors.white60,
                    ),
                    contentPadding: EdgeInsets.only(left: 10.0),
                    border: InputBorder.none,
                  ),
                ),
              ),
              widthSpace,
              InkWell(
                borderRadius: BorderRadius.circular(20.0),
                onTap: () => _attachBottomSheet(context, width),
                child: Container(
                  width: 40.0,
                  height: 40.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white.withOpacity(0.3),
                  ),
                  child: Icon(
                    Icons.attach_file,
                    color: Colors.yellow,
                    size: 18.0,
                  ),
                ),
              ),
              widthSpace,
              InkWell(
                borderRadius: BorderRadius.circular(20.0),
                onTap: () {
                  if (msgController.text != '') {
                    MessageModel messahe = MessageModel(
                      userId: currentUser.id!,
                      type: "text",
                      status: 0,
                      createdAt: DateTime.now().toString(),
                      messageText: msgController.text,
                      roomId: 1,
                      senderId: widget.sender!.id!,
                      typeSender: "user",
                    );
                    msgController.text = "";
                    MessageCubit.get(context)
                        .messageResponse!
                        .items!
                        .insert(0, messahe);
                    setState(() {});
                    MessageCubit.get(context).addMessage(
                        senderId: messahe.senderId,
                        roomId: messahe.roomId,
                        type: messahe.type,
                        message: messahe.messageText);

                    // if (now.hour > 11) {
                    //   amPm = 'PM';
                    // } else {
                    //   amPm = 'AM';
                    // }
                    // setState(() {
                    //   chatData.insert(0, {
                    //     'role': 'me',
                    //     'msg': msgController.text,
                    //     'time': (now.hour > 12)
                    //         ? '${now.hour - 12}:${now.minute} $amPm'
                    //         : '${now.hour}:${now.minute} $amPm',
                    //     'read': 'unread',
                    //     'type': 'text'
                    //   });
                    //   msgController.text = '';
                    //   _scrollController.animateTo(
                    //     0.0,
                    //     curve: Curves.easeOut,
                    //     duration: const Duration(milliseconds: 300),
                    //   );
                    // });
                  }
                },
                child: Container(
                  width: 40.0,
                  height: 40.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white.withOpacity(0.3),
                  ),
                  child: Icon(
                    Icons.send,
                    color: Colors.yellow,
                    size: 18.0,
                  ),
                ),
              ),
            ],
          ),
        )
        /*  FadeUp(
          -10.0,
          Container(
            width: width,
            height: 70.0,
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: width - 120.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white.withOpacity(0.2),
                  ),
                  child: TextField(
                    controller: msgController,
                    style: TextStyle(
                      fontSize: 13.0,
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Type a Message',
                      hintStyle: TextStyle(
                        fontSize: 13.0,
                        color: Colors.white60,
                      ),
                      contentPadding: EdgeInsets.only(left: 10.0),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                widthSpace,
                InkWell(
                  borderRadius: BorderRadius.circular(20.0),
                  onTap: () => _attachBottomSheet(context, width),
                  child: Container(
                    width: 40.0,
                    height: 40.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white.withOpacity(0.3),
                    ),
                    child: Icon(
                      Icons.attach_file,
                      color: Colors.yellow,
                      size: 18.0,
                    ),
                  ),
                ),
                widthSpace,
                InkWell(
                  borderRadius: BorderRadius.circular(20.0),
                  onTap: () {
                    if (msgController.text != '') {
                      if (now.hour > 11) {
                        amPm = 'PM';
                      } else {
                        amPm = 'AM';
                      }
                      setState(() {
                        chatData.insert(0, {
                          'role': 'me',
                          'msg': msgController.text,
                          'time': (now.hour > 12)
                              ? '${now.hour - 12}:${now.minute} $amPm'
                              : '${now.hour}:${now.minute} $amPm',
                          'read': 'unread',
                          'type': 'text'
                        });
                        msgController.text = '';
                        _scrollController.animateTo(
                          0.0,
                          curve: Curves.easeOut,
                          duration: const Duration(milliseconds: 300),
                        );
                      });
                    }
                  },
                  child: Container(
                    width: 40.0,
                    height: 40.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white.withOpacity(0.3),
                    ),
                    child: Icon(
                      Icons.send,
                      color: Colors.yellow,
                      size: 18.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )*/
        ,
      ],
    );
  }

  Widget getTypeMessage({item}){

    switch (item.type){

      case "text":
        return Container(
          padding: EdgeInsets.all(10.0),
          margin: EdgeInsets.only(
              left: 10.0, right: 10.0),
          decoration: BoxDecoration(
            borderRadius:
            BorderRadius.circular(5.0),
            color: (item.typeSender == 'sender')
                ? Colors.white
                : primaryColor,
          ),
          child: Text(
            item.messageText!,
            style: TextStyle(
              color: (item.typeSender == 'sender')
                  ? primaryColor
                  : Colors.white,
              fontSize: 15.0,
            ),
          ),
        );

      case "image":
        return InkWell(
          onTap: () {
            /* Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        FullScreenImage(
                                                          imagePath:
                                                              item['image'],
                                                        )));*/
          },
          child: Hero(
            tag: item.messageText!,
            child: Container(
              width: 150.0,
              height: 150.0,
              margin: EdgeInsets.only(
                  left: 10.0, right: 10.0),
              decoration: BoxDecoration(
                borderRadius:
                BorderRadius.circular(5.0),
                border: Border.all(
                    width: 2.0,
                    color: whiteColor),
              ),
              child: ClipRRect(
                child: item.status == 0
                    ? Image.file(
                  File(item.messageText!),
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                )
                    : Image.network(
                  baseurlImage+ item.messageText!,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        );

      case "Document":
        return InkWell(
          onTap: (){
            launchUrlOpen(url:Uri.parse(baseurlImage+item.messageText!));
          },
          child: Container(
            height: 60,
            width: 200,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: item.typeSender=="sender"?Colors.white:primaryColor
            ),
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: item.typeSender=="sender"?
                MainAxisAlignment.start:MainAxisAlignment.end,
                children: [
                  Icon(Icons.description,color:  item.typeSender=="sender"?primaryColor:Colors.white,size: 30,),
                  SizedBox(width: 10,),
                  Expanded(
                    child:item.status==0?Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ): Text(

                      item.messageText!,
                      maxLines: 1,
                      style: TextStyle(
                        color: (item.typeSender == 'sender')
                            ? Colors.black
                            : Colors.white,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      case "Audio":
        return ItemAudio(item:item);
      default:
        return SizedBox();

    }


  }


  // Bottom Sheet for Attach Here
  void _attachBottomSheet(context, width) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext bc) {
        return Container(
          width: width,
          color: Colors.transparent,
          margin: EdgeInsets.all(fixPadding),
          child: Container(
            padding: EdgeInsets.all(fixPadding * 3.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: whiteColor,
            ),
            child: Wrap(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        getAttachTile(
                            Colors.blue,
                            Icon(Icons.note_add, size: 24.0, color: whiteColor),
                            'Document',
                        onTop: (){
                          pop(context);

                          MessageCubit.get(context).getFile(typeFile:'pdf').then((value) {
                            if (MessageCubit.get(context).file != null) {
                              MessageModel messahe = MessageModel(
                                userId: currentUser.id!,
                                type: "Document",
                                status: 0,
                                createdAt: DateTime.now().toString(),
                                messageText: MessageCubit.get(context).file!.path.toString(),
                                roomId: 1,
                                senderId: widget.sender!.id!,
                                typeSender: "user",
                              );
                              MessageCubit.get(context)
                                  .messageResponse!
                                  .items!
                                  .insert(0, messahe);

                              MessageCubit.get(context)
                                  .uploadImage(MessageCubit.get(context).file!,1)
                                  .then((value) {
                                print("done"+MessageCubit.get(context).imageDawnLoaded);
                                if (MessageCubit.get(context).imageDawnLoaded != "") {

                                  MessageCubit.get(context).addMessage(
                                      message: MessageCubit.get(context).imageDawnLoaded,
                                      senderId: messahe.senderId,
                                      type: "Document",
                                      roomId: "1");

                                  MessageCubit.get(context).file = null;
                                }
                              });
                            }
                          });
                        }),
                        getAttachTile(
                            Colors.teal,
                            Icon(Icons.attach_money,
                                size: 24.0, color: whiteColor),
                            'Payment'),
                        getAttachTile(
                            Colors.red,
                            Icon(Icons.photo, size: 24.0, color: whiteColor),
                            'Gallery',onTop: (){

                          pop(context);
                          MessageCubit.get(context).getImage().then((value) {
                            if (MessageCubit.get(context).image != null) {
                              MessageModel messahe = MessageModel(
                                userId: currentUser.id!,
                                type: "image",
                                status: 0,
                                createdAt: DateTime.now().toString(),
                                messageText: MessageCubit.get(context).image!.path.toString(),
                                roomId: 1,
                                senderId: widget.sender!.id!,
                                typeSender: "user",
                              );
                              MessageCubit.get(context)
                                  .messageResponse!
                                  .items!
                                  .insert(0, messahe);

                              MessageCubit.get(context)
                                  .uploadImage(MessageCubit.get(context).image!,0)
                                  .then((value) {
                                print("done"+MessageCubit.get(context).imageDawnLoaded);
                                if (MessageCubit.get(context).imageDawnLoaded != "") {

                                  MessageCubit.get(context).addMessage(
                                      message: MessageCubit.get(context).imageDawnLoaded,
                                      senderId: messahe.senderId,
                                      type: "image",
                                      roomId: "1");

                                  MessageCubit.get(context).image=null;
                                }
                              });
                            }
                          });


                        }),
                      ],
                    ),
                    heightSpace,
                    heightSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        getAttachTile(
                            Colors.purple,
                            Icon(Icons.music_note,
                                size: 24.0, color: whiteColor),
                            'Audio',onTop: (){
                          pop(context);

                           // MessageCubit.get(context).getFile(typeFile:'mp3');
                          MessageCubit.get(context).getFile(typeFile:'mp3').then((value) {
                            if (MessageCubit.get(context).file != null) {
                              MessageModel messahe = MessageModel(
                                userId: currentUser.id!,
                                type: "Audio",
                                status: 0,
                                createdAt: DateTime.now().toString(),
                                messageText: MessageCubit.get(context).file!.path.toString(),
                                roomId: 1,
                                senderId: widget.sender!.id!,
                                typeSender: "user",
                              );
                              MessageCubit.get(context)
                                  .messageResponse!
                                  .items!
                                  .insert(0, messahe);

                              MessageCubit.get(context)
                                  .uploadImage(MessageCubit.get(context).file!,2)
                                  .then((value) {
                                print("done" + MessageCubit.get(context).imageDawnLoaded);
                                if (MessageCubit.get(context).imageDawnLoaded != "") {

                                  MessageCubit.get(context).addMessage(
                                      message: MessageCubit.get(context).imageDawnLoaded,
                                      senderId: messahe.senderId,
                                      type: "Audio",
                                      roomId: "1");

                                  MessageCubit.get(context).file = null;
                                }
                              });
                            }
                          });


                        }),
                        getAttachTile(
                            Colors.orange,
                            Icon(Icons.location_on,
                                size: 24.0, color: whiteColor),
                            'Location'),
                        getAttachTile(
                            Colors.indigo,
                            Icon(Icons.person, size: 24.0, color: whiteColor),
                            'Contact'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Bottom Sheet for Attach Ends Here

  getAttachTile(Color color, Icon icon, String title,{onTop}) {
    return InkWell(
      onTap:onTop,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 60.0,
            height: 60.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: color,
            ),
            child: icon,
          ),
          heightSpace,
          Text(
            title,
            style: attachBottomSheetTextStyle,
          ),
        ],
      ),
    );
  }

  void choiceAction(String choice) {
    if (choice == 'Report') {
      print('Report');
    } else if (choice == 'Block') {
      print('Block');
    }
  }




}


class CustomTrackShape extends RoundedRectSliderTrackShape {
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight!;
    final double trackLeft = offset.dx;
    final double trackTop = offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}