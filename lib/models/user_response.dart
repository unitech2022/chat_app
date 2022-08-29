import 'package:chat_app/models/user_model.dart';

class UserDetails {
  List<UserModel>? items;
  int? currentPage;
  int? totalPage;

  UserDetails({this.items, this.currentPage, this.totalPage});

  UserDetails.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items!.add(UserModel.fromJson(v));
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