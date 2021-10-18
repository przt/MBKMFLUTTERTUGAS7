// To parse this JSON data, do
//
//     final loginModel = loginModelFromMap(jsonString);

import 'dart:convert';

class LoginModel {
  LoginModel({
    required this.token,
    required this.userDisplayName,
    required this.userEmail,
    required this.userNicename,
  });

  String token;
  String userDisplayName;
  String userEmail;
  String userNicename;

  factory LoginModel.fromJson(String str) =>
      LoginModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginModel.fromMap(Map<String, dynamic> json) => LoginModel(
        token: json["token"],
        userDisplayName: json["user_display_name"],
        userEmail: json["user_email"],
        userNicename: json["user_nicename"],
      );

  Map<String, dynamic> toMap() => {
        "token": token,
        "user_display_name": userDisplayName,
        "user_email": userEmail,
        "user_nicename": userNicename,
      };
}
