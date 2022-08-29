import 'dart:async';

import 'package:chat_app/bloc/auth_cubit/auth_cubit.dart';
import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/pages/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../helpers/functions.dart';
import '../../helpers/helper_function.dart';

class OTPScreen extends StatefulWidget {
  final String code, phone;

  OTPScreen({required this.code, required this.phone});

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  Color? continueButtonColor = Colors.grey[500];

  String newCode = "";

  @override
  Widget build(BuildContext context) {
/*    loadingDialog() {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          // return object of type Dialog
          return Dialog(
            elevation: 0.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              height: 150.0,
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SpinKitRing(
                    color: primaryColor,
                    lineWidth: 1.5,
                    size: 35.0,
                  ),
                  heightSpace,
                  heightSpace,
                  Text('Please Wait..', style: greyMediumTextStyle),
                ],
              ),
            ),
          );
        },
      );
      Timer(
          Duration(seconds: 3),
          () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BottomBar()),
              ));
    }*/

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: whiteColor,
          appBar: AppBar(
            backgroundColor: whiteColor,
            elevation: 0.0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: blackColor,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              if (newCode == widget.code) {
                AuthCubit.get(context).loginUser(context: context,code: newCode,
                    userName: widget.phone
                );
              } else {
                HelperFunction.slt.notifyUser(
                    context: context,
                    color: Colors.grey,
                    message: "الكود غير صحيح");
              }
              // loadingDialog();
            },
            child: Icon(
              Icons.arrow_forward,
              color: whiteColor,
            ),
          ),
          body: ListView(
            children: [
              Container(
                padding: EdgeInsets.all(fixPadding * 2.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Verify details',
                      style: blackBigHeadingTextStyle,
                    ),
                    heightSpace,
                    heightSpace,
                    Text(
                      'Enter the OTP sent to your mobile number ${widget.code}',
                      style: greyMediumTextStyle,
                    ),
                    SizedBox(height: 50.0),

                    //  ammar

                    SizedBox(
                      width: double.infinity,
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: PinCodeTextField(
                          appContext: context,
                          pastedTextStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                          length: 4,
                          obscureText: false,
                          obscuringCharacter: '*',
                          textStyle: const TextStyle(color: Colors.black),
                          blinkWhenObscuring: true,
                          animationType: AnimationType.fade,
                          validator: (v) {
                            if (v
                                .toString()
                                .length < 3) {
                              return "";
                            } else {
                              return null;
                            }
                          },
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            fieldHeight: 70,
                            fieldWidth: 60,
                            inactiveColor: Colors.grey,
                            inactiveFillColor: const Color(0xFFE2E2E2),
                            borderWidth: 1,
                            selectedFillColor: Colors.white,
                            activeFillColor: Colors.white,
                          ),
                          cursorColor: Colors.black,
                          animationDuration: const Duration(milliseconds: 300),
                          backgroundColor: Colors.white,
                          enableActiveFill: true,
                          keyboardType: TextInputType.number,
                          onCompleted: (v) {
                            newCode = v;
                            printFunction(newCode);
                          },
                          onChanged: (value) {
                            printFunction(value);
                          },
                          beforeTextPaste: (text) {
                            printFunction("Allowing to paste $text");
                            return true;
                          },
                        ),
                      ),
                    ),
                    // OTP Box Start
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   children: <Widget>[
                    //     // 1 Start
                    //     Container(
                    //       width: 50.0,
                    //       height: 50.0,
                    //       alignment: Alignment.center,
                    //       decoration: BoxDecoration(
                    //         color: whiteColor,
                    //         borderRadius: BorderRadius.circular(5.0),
                    //         border: Border.all(width: 0.2, color: primaryColor),
                    //         boxShadow: <BoxShadow>[
                    //           BoxShadow(
                    //             blurRadius: 1.5,
                    //             spreadRadius: 1.5,
                    //             color: Colors.grey[200]!,
                    //           ),
                    //         ],
                    //       ),
                    //       child: TextField(
                    //         controller: firstController,
                    //         style: blackHeadingTextStyle,
                    //         keyboardType: TextInputType.number,
                    //         decoration: InputDecoration(
                    //           contentPadding: EdgeInsets.all(18.0),
                    //           border: InputBorder.none,
                    //         ),
                    //         onChanged: (v) {
                    //           FocusScope.of(context).requestFocus(secondFocusNode);
                    //           if (firstController.text != '' &&
                    //               secondController.text != '' &&
                    //               thirdController.text != '' &&
                    //               fourthController.text != '') {
                    //             setState(() {
                    //               continueButtonColor = primaryColor;
                    //             });
                    //           } else {
                    //             setState(() {
                    //               continueButtonColor = Colors.grey[500];
                    //             });
                    //           }
                    //         },
                    //       ),
                    //     ),
                    //     // 1 End
                    //     // 2 Start
                    //     Container(
                    //       width: 50.0,
                    //       height: 50.0,
                    //       alignment: Alignment.center,
                    //       decoration: BoxDecoration(
                    //         color: whiteColor,
                    //         borderRadius: BorderRadius.circular(5.0),
                    //         border: Border.all(width: 0.2, color: primaryColor),
                    //         boxShadow: <BoxShadow>[
                    //           BoxShadow(
                    //             blurRadius: 1.5,
                    //             spreadRadius: 1.5,
                    //             color: Colors.grey[200]!,
                    //           ),
                    //         ],
                    //       ),
                    //       child: TextField(
                    //         focusNode: secondFocusNode,
                    //         controller: secondController,
                    //         style: blackHeadingTextStyle,
                    //         keyboardType: TextInputType.number,
                    //         decoration: InputDecoration(
                    //           contentPadding: EdgeInsets.all(18.0),
                    //           border: InputBorder.none,
                    //         ),
                    //         onChanged: (v) {
                    //           FocusScope.of(context).requestFocus(thirdFocusNode);
                    //           if (firstController.text != '' &&
                    //               secondController.text != '' &&
                    //               thirdController.text != '' &&
                    //               fourthController.text != '') {
                    //             setState(() {
                    //               continueButtonColor = primaryColor;
                    //             });
                    //           } else {
                    //             setState(() {
                    //               continueButtonColor = Colors.grey[500];
                    //             });
                    //           }
                    //         },
                    //       ),
                    //     ),
                    //     // 2 End
                    //     // 3 Start
                    //     Container(
                    //       width: 50.0,
                    //       height: 50.0,
                    //       alignment: Alignment.center,
                    //       decoration: BoxDecoration(
                    //         color: whiteColor,
                    //         borderRadius: BorderRadius.circular(5.0),
                    //         border: Border.all(width: 0.2, color: primaryColor),
                    //         boxShadow: <BoxShadow>[
                    //           BoxShadow(
                    //             blurRadius: 1.5,
                    //             spreadRadius: 1.5,
                    //             color: Colors.grey[200]!,
                    //           ),
                    //         ],
                    //       ),
                    //       child: TextField(
                    //         focusNode: thirdFocusNode,
                    //         controller: thirdController,
                    //         style: blackHeadingTextStyle,
                    //         keyboardType: TextInputType.number,
                    //         decoration: InputDecoration(
                    //           contentPadding: EdgeInsets.all(18.0),
                    //           border: InputBorder.none,
                    //         ),
                    //         onChanged: (v) {
                    //           FocusScope.of(context).requestFocus(fourthFocusNode);
                    //           if (firstController.text != '' &&
                    //               secondController.text != '' &&
                    //               thirdController.text != '' &&
                    //               fourthController.text != '') {
                    //             setState(() {
                    //               continueButtonColor = primaryColor;
                    //             });
                    //           } else {
                    //             setState(() {
                    //               continueButtonColor = Colors.grey[500];
                    //             });
                    //           }
                    //         },
                    //       ),
                    //     ),
                    //     // 3 End
                    //     // 4 Start
                    //     Container(
                    //       width: 50.0,
                    //       height: 50.0,
                    //       alignment: Alignment.center,
                    //       decoration: BoxDecoration(
                    //         color: whiteColor,
                    //         borderRadius: BorderRadius.circular(5.0),
                    //         border: Border.all(width: 0.2, color: primaryColor),
                    //         boxShadow: <BoxShadow>[
                    //           BoxShadow(
                    //             blurRadius: 1.5,
                    //             spreadRadius: 1.5,
                    //             color: Colors.grey[200]!,
                    //           ),
                    //         ],
                    //       ),
                    //       child: TextField(
                    //         focusNode: fourthFocusNode,
                    //         controller: fourthController,
                    //         style: blackHeadingTextStyle,
                    //         keyboardType: TextInputType.number,
                    //         decoration: InputDecoration(
                    //           contentPadding: EdgeInsets.all(18.0),
                    //           border: InputBorder.none,
                    //         ),
                    //         onChanged: (v) {
                    //           if (firstController.text != '' &&
                    //               secondController.text != '' &&
                    //               thirdController.text != '' &&
                    //               fourthController.text != '') {
                    //             setState(() {
                    //               continueButtonColor = primaryColor;
                    //             });
                    //           } else {
                    //             setState(() {
                    //               continueButtonColor = Colors.grey[500];
                    //             });
                    //           }
                    //           loadingDialog();
                    //         },
                    //       ),
                    //     ),
                    //     // 4 End
                    //   ],
                    // ),
                    // OTP Box End
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
