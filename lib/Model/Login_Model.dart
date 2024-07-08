// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
    bool status;
    bool privilage;
    Token token;
    String phone;

    Login({
        required this.status,
        required this.privilage,
        required this.token,
        required this.phone,
    });

    factory Login.fromJson(Map<String, dynamic> json) => Login(
        status: json["status"],
        privilage: json["privilage"],
        token: Token.fromJson(json["token"]),
        phone: json["phone"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "privilage": privilage,
        "token": token.toJson(),
        "phone": phone,
    };
}

class Token {
    String refresh;
    String access;

    Token({
        required this.refresh,
        required this.access,
    });

    factory Token.fromJson(Map<String, dynamic> json) => Token(
        refresh: json["refresh"],
        access: json["access"],
    );

    Map<String, dynamic> toJson() => {
        "refresh": refresh,
        "access": access,
    };
}
