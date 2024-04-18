// To parse this JSON data, do
//
//     final modelUser = modelUserFromJson(jsonString);

import 'dart:convert';

ModelUser modelUserFromJson(String str) => ModelUser.fromJson(json.decode(str));

String modelUserToJson(ModelUser data) => json.encode(data.toJson());

class ModelUser {
  bool isSuccess;
  String message;
  dynamic data;

  ModelUser({
    required this.isSuccess,
    required this.message,
    required this.data,
  });

  factory ModelUser.fromJson(Map<String, dynamic> json) => ModelUser(
    isSuccess: json["isSuccess"],
    message: json["message"],
    data: json["data"],
  );

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess,
    "message": message,
    "data": data,
  };
}
