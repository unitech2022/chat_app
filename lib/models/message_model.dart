class MessageResponse{
  List<MessageModel>? items;
  int? currentPage;
  int? totalPage;

  MessageResponse({this.items, this.currentPage, this.totalPage});

  MessageResponse.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items!.add(new MessageModel.fromJson(v));
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

class MessageModel {
  int? id;
  int? roomId;
  String? userId;
  String? senderId;
  String? messageText;
  String? type;
  String? typeSender;
  int? status;
  String? createdAt;

  MessageModel(
      {this.id,
        this.roomId,
        this.userId,
        this.senderId,
        this.messageText,
        this.type,
        this.typeSender,
        this.status,
        this.createdAt});

  MessageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roomId = json['roomId'];
    userId = json['userId'];
    senderId = json['senderId'];
    messageText = json['messageText'];
    type = json['type'];
    typeSender = json['typeSender'];
    status = json['status'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['roomId'] = this.roomId;
    data['userId'] = this.userId;
    data['senderId'] = this.senderId;
    data['messageText'] = this.messageText;
    data['type'] = this.type;
    data['typeSender'] = this.typeSender;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
