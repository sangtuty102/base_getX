// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

class LoginResponse {
  LoginResponse({
    required this.code,
    this.data,
  });

  int code;
  Data? data;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        code: json["code"],
        data: json["data"] != null ? Data.fromJson(json["data"]) : null,
      );
}

class Data {
  Data({
    required this.userId,
    required this.fullName,
    this.email,
    this.phone,
    this.address,
    this.role,
    required this.createdAt,
    required this.token,
  });

  String userId;
  String fullName;
  String? email;
  String? phone;
  String? address;
  String? role;
  DateTime createdAt;
  String token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["userId"],
        fullName: json["fullName"],
        email: json["email"],
        phone: json["phone"],
        address: json["address"],
        role: json["role"],
        createdAt: DateTime.parse(json["createdAt"]),
        token: json["token"],
      );
}
