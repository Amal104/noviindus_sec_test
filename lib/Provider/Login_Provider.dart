import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import '../Constants/AppURLs.dart';
import '../Model/Login_Model.dart';
import '../Utils/Appcolor.dart';
import '../Utils/SnackBar.dart';
import '../View/Screens/HomeScreen.dart';
import '../View/Screens/LoginScreen.dart';

class LoginProvider extends ChangeNotifier {
  TextEditingController mobileController = TextEditingController();

  final _dio = Dio();

  Future<void> login(BuildContext context) async {
    try {
      if (mobileController.text.isNotEmpty) {
        var formData = FormData.fromMap({
          'country_code': "+91",
          'phone': mobileController.text,
        });
        if (kDebugMode) {
          print("${AppUrl.baseUrl}${AppUrl.loginUrl}");
        }
        var response = await _dio.post(
          "${AppUrl.baseUrl}${AppUrl.loginUrl}",
          data: formData,
        );
        if (response.statusCode == 202) {
          final data = Login.fromJson(response.data);
          final token = data.token.access;

          if (kDebugMode) {
            print(response.data);
            print(token);
          }

          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString("logintoken", token);
          Customsnackbar.showSnackBar(
              context, "Yaay!", "Login Successful", AppColor.black);
          Get.off(() => const HomeScreen());
        } else {
          var status = response.data;
          if (kDebugMode) {
            print(status);
          }
          Customsnackbar.showSnackBar(
              context, "Oops!", "$status", AppColor.black);
        }
      } else {
        Customsnackbar.showSnackBar(
            context, "Oops!", "Enter valid data", AppColor.black);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  tokencheck() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("logintoken");
    if (token != null) {
      Timer(const Duration(seconds: 4), (() {
        Get.off(
          () => const HomeScreen(),
          transition: Transition.upToDown,
        );
      }));
    } else {
      Timer(const Duration(seconds: 4), (() {
        Get.off(
          () => const LoginScreen(),
          transition: Transition.upToDown,
        );
      }));
    }
  }

}
