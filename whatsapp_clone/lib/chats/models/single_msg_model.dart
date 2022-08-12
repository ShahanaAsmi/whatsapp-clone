// To parse this JSON data, do
//
//     final messageModel = messageModelFromJson(jsonString);

import 'dart:convert';

MessageModel messageModelFromJson(String str) =>
    MessageModel.fromJson(json.decode(str));

String messageModelToJson(MessageModel data) => json.encode(data.toJson());

class MessageModel {
  MessageModel({
    this.isSend,
    this.isReaded,
    this.sendAt,
    this.message,
  });

  bool? isSend;
  bool? isReaded;
  String? sendAt;
  String? message;

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        isSend: json["isSend"],
        isReaded: json["isReaded"],
        sendAt: json["sendAt"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "isSend": isSend,
        "isReaded": isReaded,
        "sendAt": sendAt,
        "message": message,
      };
}
