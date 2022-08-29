import 'dart:convert';

import 'package:chat_app/helpers/functions.dart';

import 'package:chat_app/models/user_model.dart';
import 'package:chat_app/widget/show_loading.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import '../../helpers/constants.dart';
import '../../pages/auth/otp_screen.dart';
import '../../pages/bottom_bar.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of<AuthCubit>(context);

  checkUserName({phone,context}) async {
    // emit(CheckUserAuthStateLoad());

    var request =
        http.MultipartRequest('POST', Uri.parse(baseUrl + checkUserNamePoint));
    request.fields.addAll({'phone': phone});

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String jsonsDataString = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonsDataString);
      pop(context);

      pushPage(
          page: OTPScreen(code: jsonData["code"], phone: phone),
          context: context);

      emit(CheckUserAuthStateSuccess(
          phone: phone, code: jsonData["code"], status: jsonData["status"]));
    } else {
      printFunction("errrrrrrrrrror");
      emit(CheckUserAuthStateError());
    }
  }

  bool isValidate = false;

  validateUser({username, email, fullName}) async {
    emit(ValidateAuthStateLoad());

    var request =
        http.MultipartRequest('POST', Uri.parse(baseUrl + validatePoint));
    request.fields.addAll({'email': email, 'userName': username});

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String jsonsDataString = await response.stream.bytesToString();
      // final jsonData = jsonDecode(jsonsDataString);
      printFunction(jsonsDataString);

      registerUser(email: email, userName: username, fullName: fullName);
    } else if (response.statusCode == 400) {
      String jsonsDataString = await response.stream.bytesToString();
      // final jsonData = jsonDecode(jsonsDataString);
      printFunction(jsonsDataString);
      emit(ValidateAuthStateError(jsonsDataString));
    } else {
      printFunction(response.statusCode);
      emit(ValidateAuthStateError("errrrrrrrrrror"));
    }
  }

  registerUser({fullName, email, userName, role, context}) async {
    showLoadingDialog(context);
    emit(RegisterAuthStateLoad());

    var request =
        http.MultipartRequest('POST', Uri.parse(baseUrl + registerPoint));
    request.fields.addAll({
      'fullName': "person",
      'email': "email",
      'userName': userName,
      'knownName': 'askdkalshkjsa',
      'Role': "user",
      'password': 'Abc123@'
    });

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String jsonsDataString = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonsDataString);
      printFunction(jsonData);
      pop(context);

      pushPage(
          page: OTPScreen(code: jsonData["code"], phone: userName),
          context: context);
      emit(
          RegisterAuthStateSuccess(code: jsonData["code"], userName: userName));
    } else if(response.statusCode == 500){

      checkUserName(phone: userName,context: context
      );
    }else {
      pop(context);
      printFunction(response.reasonPhrase);
      emit(RegisterAuthStateError());
    }
  }

  UserModel user = UserModel();

  loginUser({code, userName, context}) async {
    showLoadingDialog(context);
    emit(LoginAuthStateLoad());

    var request =
        http.MultipartRequest('POST', Uri.parse(baseUrl + loginPoint));
    request.fields.addAll({'code': code, 'userName': userName});

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String jsonsDataString = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonsDataString);
      printFunction(jsonData);
      UserResponse userResponse = UserResponse.fromJson(jsonData);
      token = "Bearer " + userResponse.token!;
      currentUser = user = userResponse.user!;

      // if(data['driver']!=null) currentUser.driver = Driver.fromJson(data['driver']);
      await saveToken();
      printFunction("currentUser${token}");
      pop(context);
      pushPage(context: context, page: BottomBar());

      emit(LoginAuthStateSuccess(userResponse));
    }
    else {
      pop(context);
      printFunction("errrrrrrrrrror");
      emit(LoginAuthStateError());
    }
  }

  bool isChecked = false;

  changeCheckBox(bool checked) {
    isChecked = checked;
    printFunction(isChecked);
    emit(ChangeCheckBox());
  }


  updateDeviceToken({token, userId,context}) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse(baseUrl + '/auth/update-deviceToken'));
    request.fields.addAll({'UserId': userId, 'Token': tokenFCM});

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print("updatedToken");

    } else {
      print("ErrorUpdatedToken");
    }
  }
}
