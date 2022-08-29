import 'package:chat_app/models/user_model.dart';

class RoomResponse {
  List<Items>? items;
  int? currentPage;
  int? totalPage;

  RoomResponse({this.items, this.currentPage, this.totalPage});

  RoomResponse.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    currentPage = json['currentPage'];
    totalPage = json['totalPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['currentPage'] = this.currentPage;
    data['totalPage'] = this.totalPage;
    return data;
  }
}

class Items {
  Room? room;

  UserModel? sender;

  Items({this.room,this.sender});

  Items.fromJson(Map<String, dynamic> json) {
    room = json['room'] != null ? new Room.fromJson(json['room']) : null;

    sender = json['sender'] != null ? UserModel.fromJson(json['sender']) :null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.room != null) {
      data['room'] = this.room!.toJson();
    }

    data['sender'] = this.sender;
    return data;
  }
}
class Room {
  int? id;
  String? message;
  String? senderId;
  String? userId;
  String? type;
  int? status;
  String? createdAt;

  Room(
      {this.id,
        this.message,
        this.senderId,
        this.userId,
        this.type,
        this.status,
        this.createdAt});

  Room.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    message = json['message'];
    senderId = json['senderId'];
    userId = json['userId'];
    type = json['type'];
    status = json['status'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['message'] = this.message;
    data['senderId'] = this.senderId;
    data['userId'] = this.userId;
    data['type'] = this.type;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    return data;
  }
}