// To parse this JSON data, do
//
//     final callModel = callModelFromJson(jsonString);

import 'dart:convert';

CallModel callModelFromJson(String str) => CallModel.fromJson(json.decode(str));

String callModelToJson(CallModel data) => json.encode(data.toJson());

class CallModel {
  CallModel(
      {this.avatar,
      this.name,
      this.date,
      this.updatedAt,
      this.isGroup,
      this.callType});

  String? avatar;
  String? name;
  String? date;
  String? updatedAt;
  bool? isGroup;
  bool? callType;

  factory CallModel.fromJson(Map<String, dynamic> json) => CallModel(
        avatar: json["avatar"],
        name: json["name"],
        date: json["date"],
        updatedAt: json["updatedAt"],
        isGroup: json["isGroup"],
      );

  Map<String, dynamic> toJson() => {
        "avatar": avatar,
        "name": name,
        "date": date,
        "updatedAt": updatedAt,
        "isGroup": isGroup,
      };
}
