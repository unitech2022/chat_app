import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../constants/constants.dart';

void showLoadingDialog(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.1),
      builder: (context) {
        return  LoadingDialog();
      });
}

class LoadingDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Duration insetAnimationDuration = const Duration(milliseconds: 10);
    Curve insetAnimationCurve = Curves.bounceIn;

    RoundedRectangleBorder _defaultDialogShape = RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)));

    return MediaQuery.removeViewInsets(
      removeLeft: true,
      removeTop: true,
      removeRight: true,
      removeBottom: true,
      context: context,
      child: Container(
        color: Colors.transparent,
        child:  SpinKitDoubleBounce(
          color: primaryColor,
          size: 70,

        ),
      ),
    );
  }
}
