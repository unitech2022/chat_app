import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/bloc/user_cubit/user_cubit.dart';
import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/pages/chat/message_screen.dart';
import 'package:chat_app/pages/groups/new_group.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

import '../../helpers/constants.dart';

class SelectContact extends StatefulWidget {
  @override
  _SelectContactState createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    UserCubit.get(context).getUsers();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {

    print(currentUser.id.toString()+"\n");
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Select contact',
              style: whiteNormalTextStyle,
            ),
            SizedBox(height: 3.0),
            Text(
              '232 contacts',
              style: whiteSmallTextStyle,
            )
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: UserCubit.get(context).loadingUsers?
      Center(
        child: CircularProgressIndicator(
          color: primaryColor,
          strokeWidth: 3,
        ),
      )

      :ListView.builder(
        itemCount: UserCubit.get(context).userResponse!.items!.length + 1 ,
        itemBuilder: (context, index) {
          // final item = UserCubit.get(context).userResponse!.items![index];

          print(index.toString()+">>>>>>>>>"+ UserCubit.get(context).userResponse!.items!.length.toString());

          return  (index == 0)
              ? Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: NewGroup()));
                },
                child: Container(
                  padding: EdgeInsets.all(fixPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 50.0,
                        height: 50.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color: primaryColor,
                        ),
                        child: Icon(
                          Icons.group,
                          color: whiteColor,
                          size: 20.0,
                        ),
                      ),
                      widthSpace,
                      Expanded(
                        child: Text(
                          'New group',
                          style: blackNormalTextStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
                 InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child: MessageScreen(
                                 sender: UserCubit.get(context).userResponse!.items![index], )));
                      },
                      child: Container(
                        padding: EdgeInsets.all(fixPadding),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 50.0,
                              width: 50.0,
                              alignment: Alignment.topRight,
                              padding: EdgeInsets.all(fixPadding),
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(30.0),

                              ),
                              child:   ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: CachedNetworkImage(
                                  imageUrl: UserCubit.get(context).userResponse!.items![index].imageUrl!=null? baseurlImage+UserCubit.get(context).userResponse!.items![index].imageUrl!:"",
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
                                  const Icon(Icons.person),
                                ),
                              ),
                            ),
                            widthSpace,
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    UserCubit.get(context).userResponse!.items![index].fullName!,
                                    style: blackNormalTextStyle,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 5.0),
                                  Text(
                                    "I use whats",
                                    style: greySmallTextStyle,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
            ],
          )
              : (index == UserCubit.get(context).userResponse!.items!.length)
              ? Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                padding: EdgeInsets.all(fixPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 50.0,
                      height: 50.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Icon(
                        Icons.share,
                        color: blackColor,
                        size: 20.0,
                      ),
                    ),
                    widthSpace,
                    Expanded(
                      child: Text(
                        'Invite friends',
                        style: blackNormalTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
              :  InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: MessageScreen(
                        sender: UserCubit.get(context).userResponse!.items![index],)));
            },
            child: Container(
              padding: EdgeInsets.all(fixPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 50.0,
                    width: 50.0,
                    alignment: Alignment.topRight,
                    padding: EdgeInsets.all(fixPadding),
                    decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(30.0),

                    ),
                    child:   ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: CachedNetworkImage(
                        imageUrl: UserCubit.get(context).userResponse!.items![index].imageUrl!=null? baseurlImage+UserCubit.get(context).userResponse!.items![index].imageUrl!:"",
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
                        const Icon(Icons.person),
                      ),
                    ),
                  ),
                  widthSpace,
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          UserCubit.get(context).userResponse!.items![index].fullName!,
                          style: blackNormalTextStyle,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          'about',
                          style: greySmallTextStyle,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  },
);
  }
}
