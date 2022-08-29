import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/pages/auth/onboarding.dart';
import 'package:flutter/material.dart';

class DeleteAccount extends StatefulWidget {
  @override
  _DeleteAccountState createState() => _DeleteAccountState();
}

class _DeleteAccountState extends State<DeleteAccount> {
  deleteAccountDialog() {
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
                      'Are you sure want to delete your account?',
                      style: blackHeadingTextStyle,
                    ),
                    heightSpace,
                    heightSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            width: (MediaQuery.of(context).size.width -
                                    fixPadding * 14.0) /
                                2,
                            padding: EdgeInsets.all(fixPadding),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2.0),
                              color: greyColor.withOpacity(0.6),
                            ),
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                fontSize: 15.0,
                                color: blackColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OnBoarding()));
                          },
                          child: Container(
                            width: (MediaQuery.of(context).size.width -
                                    fixPadding * 14.0) /
                                2,
                            padding: EdgeInsets.all(fixPadding),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2.0),
                              color: Colors.red[800],
                            ),
                            child: Text(
                              'Delete',
                              style: TextStyle(
                                fontSize: 15.0,
                                color: whiteColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        title: Text(
          'Delete my account',
          style: appBarTextStyle,
        ),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(fixPadding * 2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.warning,
                  color: Colors.red,
                  size: 22.0,
                ),
                widthSpace,
                widthSpace,
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Delete your account will:',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 17.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      heightSpace,
                      Text(
                        '- Delete your account from ChatApp',
                        style: greyMediumTextStyle,
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        '- Erase your message history',
                        style: greyMediumTextStyle,
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        '- Delete you from all of your ChatApp groups',
                        style: greyMediumTextStyle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          divider(),
          Wrap(
            children: [
              InkWell(
                onTap: () => deleteAccountDialog(),
                child: Container(
                  margin: EdgeInsets.all(fixPadding * 2.0),
                  padding: EdgeInsets.fromLTRB(fixPadding * 1.5, fixPadding,
                      fixPadding * 1.5, fixPadding),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2.0),
                    color: Colors.red[800],
                  ),
                  child: Text(
                    'Delete my account'.toUpperCase(),
                    style: TextStyle(
                      fontSize: 15.0,
                      color: whiteColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
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
