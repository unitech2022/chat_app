import 'package:chat_app/constants/constants.dart';
import 'package:flutter/material.dart';

class VideoCall extends StatelessWidget {
  final String? name;
  VideoCall({Key? key, required this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/girl_1.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.black.withOpacity(0.05),
          elevation: 0.0,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                name!,
                style: appBarTextStyle,
              ),
              SizedBox(height: 4.0),
              Text(
                '123456789',
                style: msgScreenOnlineTextStyle,
              )
            ],
          ),
        ),
        body: Container(
          height: height,
          padding: EdgeInsets.all(fixPadding * 2.0),
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 56.0,
                      height: 56.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28.0),
                        color: Colors.red,
                      ),
                      child:
                          Icon(Icons.call_end, color: whiteColor, size: 25.0),
                    ),
                  ),
                  widthSpace,
                  widthSpace,
                  Text(
                    '4:08',
                    style: badgeTextStyle,
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: fixPadding * 0.7),
                    child: IconButton(
                      icon: Icon(Icons.loop, color: whiteColor),
                      onPressed: () {},
                    ),
                  ),
                  Container(
                    width: 110.0,
                    height: 160.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(width: 1.5, color: whiteColor.withOpacity(0.6)),
                      image: DecorationImage(
                        image: AssetImage('assets/girl_2.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
