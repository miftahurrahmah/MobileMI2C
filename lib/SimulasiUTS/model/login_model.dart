import 'dart:convert';

ModelLogin modelLoginFromJson(String str) => ModelLogin.fromJson(json.decode(str));

String modelLoginToJson(ModelLogin data) => json.encode(data.toJson());

class ModelLogin {
  int value;
  String message;
  String username;
  String nama;
  String email;
  String nohp;
  String id;

  ModelLogin({
    required this.value,
    required this.message,
    required this.username,
    required this.nama,
    required this.email,
    required this.nohp,
    required this.id,
  });

  factory ModelLogin.fromJson(Map<String, dynamic> json) => ModelLogin(
    value: json["value"] ?? 0, // Handle nilai null dengan memberikan nilai default
    message: json["message"] ?? "",
    username: json["username"] ?? "",
    nama: json["nama"] ?? "",
    email: json["email"] ?? "",
    nohp: json["nohp"] ?? "",
    id: json["id"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "message": message,
    "username": username,
    "nama": nama,
    "email": email,
    "nohp": nohp,
    "id": id,
  };
}
