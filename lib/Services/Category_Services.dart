import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Constants/AppURLs.dart';
import '../Model/Category_model.dart';

class CategoryServices {
  final _dio = Dio();
  Future<List<Categories>> getCategory() async {
    List<Categories> data = [];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("logintoken");
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
    };
    if (kDebugMode) {
      print(token);
      print("${AppUrl.baseUrl}${AppUrl.category}");
    }
    try {
      var response = await _dio.get(
        "${AppUrl.baseUrl}${AppUrl.category}",
        options: Options(
          headers: headers,
        ),
      );
      if (kDebugMode) {
        print(response);
      }
      var json = response.data;
      response.data['categories']
          .map((e) => data.add(Categories.fromJson(e)))
          .toList();
      // data = List<PatientModel>.from(json.map((x) => PatientModel.fromJson(x)));
      print(json);
    } catch (e, stackTrace) {
      log(e.toString());
      log(stackTrace.toString());
    }
    return data;
  }
}
