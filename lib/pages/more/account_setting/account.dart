import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/pages/more/account_setting/delete_account.dart';
import 'package:chat_app/pages/more/account_setting/privacy.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        title: Text(
          'Account',
          style: appBarTextStyle,
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: () => Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: PrivacySetting())),
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Icon(
                Icons.lock,
                color: greyColor,
                size: 22.0,
              ),
            ),
            title: Text(
              'Privacy',
              style: blackNormalTextStyle,
            ),
          ),
          ListTile(
            onTap: () => Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: DeleteAccount())),
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Icon(
                Icons.delete,
                color: greyColor,
                size: 22.0,
              ),
            ),
            title: Text(
              'Delete my account',
              style: blackNormalTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
