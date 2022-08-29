import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:chat_app/helpers/constants.dart';
import 'package:chat_app/helpers/functions.dart';
import 'package:chat_app/models/room_model.dart';
import 'package:chat_app/models/user_model.dart';
import 'package:chat_app/widget/show_loading.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../../models/user_response.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  static UserCubit get(context) => BlocProvider.of<UserCubit>(context);
  UserDetails? userResponse;
  bool loadingUsers=false;
  getUsers()async{

    loadingUsers=true;
    emit(GetUsersStateLoad());
    var request = http.MultipartRequest('GET', Uri.parse(baseUrl+'/user/get-Users'));
    request.fields.addAll({
      'page': '1',
      'ItemsPerPage': '15',
    'userId': currentUser.id!,
    });

    http.StreamedResponse response = await request.send();
    print(response.statusCode.toString()+"users>>>");
    if (response.statusCode == 200) {

      String jsonsDataString = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonsDataString);
      userResponse=UserDetails.fromJson(jsonData);
      printFunction(jsonData);
      loadingUsers=false;
      emit(GetUsersStateSuccess());
    }
    else {
      loadingUsers=false;
      emit(GetUsersStateError());
    }

  }
}
