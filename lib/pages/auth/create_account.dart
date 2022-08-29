import 'dart:io';

import 'package:chat_app/bloc/auth_cubit/auth_cubit.dart';
import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/helpers/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:chat_app/pages/auth/otp_screen.dart';
import 'package:page_transition/page_transition.dart';

import '../../helpers/helper_function.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  Color? continueButtonColor = Colors.grey[500];
  String phoneNumber = '';
  String? phoneIsoCode;
  final TextEditingController controller = TextEditingController();
  String initialCountry = 'IN';
  PhoneNumber number = PhoneNumber(isoCode: 'IN');

  void onPhoneNumberChange(String number, String internationalizedPhoneNumber,
      String isoCode) {
    setState(() {
      phoneNumber = number;
      phoneIsoCode = isoCode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {

        if(state is RegisterAuthStateSuccess){


        }
      },
      builder: (context, state) {
        return Scaffold(
          floatingActionButton:


          FloatingActionButton(
            onPressed: () {
              if(isValidate()){
                AuthCubit.get(context).registerUser(context: context,userName: controller.text
                );

              }

            },
            child: Icon(
              Icons.arrow_forward,
              color: whiteColor,
            ),
          ),
          body: WillPopScope(
            child: ListView(
              children: [
                SizedBox(height: 30.0),
                Padding(
                  padding: EdgeInsets.all(fixPadding * 2.0),
                  child: Text(
                    'Enter your mobile number',
                    style: blackBigHeadingTextStyle,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
                  child: Text(
                    'ChatApp will send an SMS message to verify your mobile number.',
                    style: greyNormalTextStyle,
                    strutStyle: StrutStyle(
                      height: 1.6,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(fixPadding * 2.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mobile Number',
                        style: greyMediumBoldTextStyle,
                      ),
                      heightSpace,
                      InternationalPhoneNumberInput(

                        textStyle: TextStyle(
                          color: blackColor,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                        autoValidateMode: AutovalidateMode.disabled,
                        selectorTextStyle: TextStyle(
                          color: blackColor,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                        initialValue: number,
                        textFieldController: controller,
                        // inputBorder: InputBorder.none,
                        inputDecoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                              left: 10.0, bottom: 15.0),
                          hintText: 'Mobile Number',
                          hintStyle: TextStyle(
                            color: greyColor,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                          // border: InputBorder.none,
                        ),
                        selectorConfig: SelectorConfig(
                          selectorType: PhoneInputSelectorType.DIALOG,
                        ),
                        onInputChanged: (v) {
                          if (controller.text != '') {
                            setState(() {
                              continueButtonColor = primaryColor;
                            });
                          } else {
                            setState(() {
                              continueButtonColor = Colors.grey[500];
                            });
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            onWillPop: () async {
              bool exitStatus = onWillPop();
              if (exitStatus) {
                exit(0);
              }
              return false;
            },
          ),
        );
      },
    );
  }

  onWillPop() {
    return true;
  }

  bool isValidate() {
    if (controller.text.isEmpty &&
        controller.text.trim().length == 9 &&
        controller.text.trim().startsWith("5")) {
      HelperFunction.slt.notifyUser(
          context: context, color: Colors.grey, message: "أدخل رقم الهاتف");
      return false;
    } else {
      return true;
    }
  }
}
