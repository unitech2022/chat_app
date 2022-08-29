import 'package:chat_app/constants/constants.dart';
import 'package:flutter/material.dart';

class TermsOfService extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        title: Text(
          'Terms of Service',
          style: appBarTextStyle,
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(fixPadding * 2.0),
            child: Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
              style: blackNormalTextStyle,
              textAlign: TextAlign.justify,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(fixPadding * 2.0),
            child: Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
              style: blackNormalTextStyle,
              textAlign: TextAlign.justify,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(fixPadding * 2.0),
            child: Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
              style: blackNormalTextStyle,
              textAlign: TextAlign.justify,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(fixPadding * 2.0),
            child: Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
              style: blackNormalTextStyle,
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
