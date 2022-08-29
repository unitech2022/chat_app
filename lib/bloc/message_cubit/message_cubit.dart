import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:chat_app/helpers/constants.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;

part 'message_state.dart';

class MessageCubit extends Cubit<MessageState> {
  MessageCubit() : super(MessageInitial());

  static MessageCubit get(context) => BlocProvider.of<MessageCubit>(context);

  addMessage({roomId, type, senderId, message}) async {
    emit(AddMessagesStateLoad());
    var request = http.MultipartRequest(
        'POST', Uri.parse(baseUrl + '/message/add-message'));
    request.fields.addAll({
      'RoomId': roomId.toString(),
      'type': type,
      'status': "1",
      'senderId': senderId.toString(),
      'userId': currentUser.id!,
      'messageText': message
    });

    http.StreamedResponse response = await request.send();
    print(response.statusCode.toString() + ">>>>>>>Add");
    if (response.statusCode == 200) {
      getMessages(senderId: senderId, status: 1, page: 1);
      emit(AddMessagesStateSuccess());
    } else {
      emit(AddMessagesStateError());
    }
  }

  MessageResponse? messageResponse;
  bool getMessagesLoad = false;

  getMessages({page, senderId, status = 0}) async {
    if (status == 0) {
      getMessagesLoad = true;
    }
    emit(GetMessagesStateLoad());
    var request = http.MultipartRequest(
        'GET', Uri.parse(baseUrl + '/message/get-MessagesById'));
    request.fields.addAll({
      'page': page.toString(),
      'ItemsPerPage': '10',
      'senderId': senderId,
      'userId': currentUser.id!
    });

    http.StreamedResponse response = await request.send();

    print(response.statusCode.toString() + ">>>>>>>GET MESSAGES");

    if (response.statusCode == 200) {
      String jsonsDataString = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonsDataString);
      messageResponse = MessageResponse.fromJson(jsonData);
      print(jsonData.toString() + ">>>>>>>>>>>>");
      if (status == 0) {
        getMessagesLoad = false;
      }
      emit(GetMessagesStateSuccess());
    } else {
      if (status == 0) {
        getMessagesLoad = false;
      }
      emit(GetMessagesStateError());
    }
  }

  final picker = ImagePicker();
  File? image;

  Future getImage() async {
    image = null;
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      print('selected.' + image.toString());
    } else {
      print('No image selected.');
    }

    emit(ChangeStatePage());
  }

  File? file;

  Future getFile({typeFile})async{
    file = null;

    if(typeFile=="mp3"){

      await FilePicker.platform.pickFiles(type: FileType.audio,

          withReadStream:
          true
      ).then((value){

        if(value!=null){
         var platform=value.files.single;
          file = File(platform.path!);
          print(file!.path.toString());
        }else{
          print('No image selected.');
        }
        emit(ChangeStatePage());

      });
    }else{
      await FilePicker.platform.pickFiles(type: FileType.custom,

        allowedExtensions: [typeFile],

      ).then((value){

        if(value!=null){

          file = File(value.files.single.path!);
          print(file.toString());
        }else{
          print('No image selected.');
        }
        emit(ChangeStatePage());

      });

    }


  }

  bool loadImage = false;
  String imageDawnLoaded = "";

  Future<dynamic> uploadImage(file,status) async {
    loadImage = true;
     imageDawnLoaded = "";
    emit(UploadImageLoad());
    const url = baseUrl + uploadImagePoint;
    var request = http.MultipartRequest("POST", Uri.parse(url));
    request.fields.addAll({
      'status': status.toString()
    });
    var multipartFile = await http.MultipartFile.fromPath(
      "file",
      file.path,
    );
    request.files.add(multipartFile);
    http.StreamedResponse response = await request.send();
    var postBody = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      imageDawnLoaded = postBody.body.toString();
      print(imageDawnLoaded+">>>>>>>>>>image");
       emit(UploadImageSuccess());

      //update profile

    } else {
      return "a.jpg";
    }
  }
}
