import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:noviindus_sec_test/Utils/SnackBar.dart';
import 'package:path/path.dart' as path;
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Constants/AppURLs.dart';
import '../Utils/Appcolor.dart';

class AddfeedProvider extends ChangeNotifier {
  final _dio = Dio();
  final ImagePicker _picker = ImagePicker();
  File? _videoFile;
  File? _imageFile;

  Future<void> pickVideo() async {
    final pickedFile = await _picker.pickVideo(source: ImageSource.gallery);
    if (pickedFile != null) {
      _videoFile = File(pickedFile.path);
      notifyListeners();
    }
  }

  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _imageFile = File(pickedFile.path);
      notifyListeners();
    }
  }

  Future<void> uploadFiles() async {
    if (_videoFile != null && _imageFile != null) {
      await sendData(_videoFile!, _imageFile!);
    } else {
      print('Please select both video and image files.');
    }
  }

  Future<void> sendData(File videoFile, File imageFile) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("logintoken");
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
    };
    try {
      FormData formData = FormData();

      // Add the video file
      formData.files.add(
        MapEntry(
          "video",
          await MultipartFile.fromFile(
            _videoFile!.path,
            filename: path.basename(_videoFile!.path),
            contentType: MediaType('video', 'mp4'),
          ),
        ),
      );

      // Add the image file
      formData.files.add(
        MapEntry(
          "image",
          await MultipartFile.fromFile(
            _imageFile!.path,
            filename: path.basename(_imageFile!.path),
            contentType: MediaType('image', 'jpeg'),
          ),
        ),
      );

      Response response = await _dio.post(
          "${AppUrl.baseUrl}${AppUrl.myfeed}", // Replace with your API endpoint
          data: formData,
          options: Options(
            headers: headers,
          ));
      if (response.statusCode == 401) {
        if (kDebugMode) {
          print('Response: ${response.data}');
          print(response.statusCode);
        }
        // Customsnackbar.showSnackBar(context, "Success",
        //     "Patient registerd successfully", AppColor.white);
      } else {
        // Customsnackbar.showSnackBar(
        //     context, "Failed", "Patient registration failed!", Colors.red);
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
