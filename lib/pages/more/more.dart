import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/pages/more/account_setting/account.dart';
import 'package:chat_app/pages/more/my_profile.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class More extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        title: Text(
          'Settings',
          style: appBarTextStyle,
        ),
      ),
      body: ListView(
        children: [
          profileImageName(context),
          divider(),
          settingTiles(context),
          divider(),
          ListTile(
            onTap: () {},
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Icon(
                Icons.group,
                color: greyColor,
                size: 19.0,
              ),
            ),
            title: Text(
              'Invite friend',
            ),
          ),
        ],
      ),
    );
  }

  profileImageName(context) {
    return InkWell(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyProfile())),
      child: Container(
        padding: EdgeInsets.only(
          top: fixPadding * 2.0,
          bottom: fixPadding * 2.0,
          right: fixPadding,
          left: fixPadding,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: Hero(
                tag: 'profile image',
                child: Image.asset(
                  'assets/user_profile/user_3.jpg',
                  width: 60.0,
                  height: 60.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            widthSpace,
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Allison Perry',
                    style: blackNormalTextStyle,
                  ),
                  SizedBox(height: 3.0),
                  Text(
                    'Push yourself, because no one else is going to do it for you.',
                    style: greySmallTextStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  settingTiles(context) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.rightToLeft, child: Account()));
          },
          leading: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Icon(
              Icons.vpn_key_sharp,
              color: greyColor,
              size: 19.0,
            ),
          ),
          title: Text(
            'Account',
          ),
          subtitle: Text('Privacy and delete account'),
        ),
        ListTile(
          onTap: () {},
          leading: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Icon(
              Icons.notifications,
              color: greyColor,
              size: 19.0,
            ),
          ),
          title: Text(
            'Notifications',
          ),
          subtitle: Text('Message and group'),
        ),
      ],
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
