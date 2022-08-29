import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:chat_app/helpers/constants.dart';
import 'package:chat_app/helpers/functions.dart';
import 'package:chat_app/models/room_model.dart';
import 'package:chat_app/widget/show_loading.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'rooms_state.dart';

class RoomsCubit extends Cubit<RoomsState> {
  RoomsCubit() : super(RoomsInitial());
  static RoomsCubit get(context) => BlocProvider.of<RoomsCubit>(context);
RoomResponse? roomModel;
bool loadingRooms=false;
  getRooms({context,userId})async{

  loadingRooms=true;
    emit(GetRoomsStateLoad());
    var request = http.MultipartRequest('GET', Uri.parse(baseUrl+'/room/get-roomsById'));
    request.fields.addAll({
      'page': '1',
      'ItemsPerPage': '1',
      'userId':userId
    });

    http.StreamedResponse response = await request.send();
    print(response.statusCode.toString()+"rooms>>>");
    if (response.statusCode == 200) {

      String jsonsDataString = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonsDataString);
      roomModel=RoomResponse.fromJson(jsonData);
      printFunction(jsonData);
      loadingRooms=false;
      emit(GetRoomsStateSuccess());
    }
    else {

      loadingRooms=false;
    emit(GetRoomsStateError());
    }

  }
}
