// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../Constants/AppURLs.dart';

// class AddfeedProvider extends ChangeNotifier {
//   final _dio = Dio();
//   final ImagePicker _picker = ImagePicker();
//   File? _videoFile;
//   File? _imageFile;

//   Future<void> sendPatientData(BuildContext context) async {

//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     final token = prefs.getString("logintoken");
//     Map<String, String> headers = {
//       'Authorization': 'Bearer $token',
//     };
//     try {

//        FormData formData = FormData();

//       // Add the video file
//       formData.files.add(
//         MapEntry(
//           "video",
//           await MultipartFile.fromFile(
//             _videoFile!.path,
//             filename: path.basename(_videoFile!.path),
//             contentType: MediaType('video', 'mp4'),
//           ),
//         ),
//       );

//       // Add the image file
//       formData.files.add(
//         MapEntry(
//           "image",
//           await MultipartFile.fromFile(
//             imageFile.path,
//             filename: path.basename(imageFile.path),
//             contentType: MediaType('image', 'jpeg'),
//           ),
//         ),
//       );

//       Response response = await _dio.post(
//         "${AppUrl.baseUrl}${AppUrl.myfeed}", // Replace with your API endpoint
//         data: formData,
//         options: Options(
//           headers: headers,
//         )
//       );
//       if (response.statusCode == 401) {
//         if (kDebugMode) {
//           print('Response: ${response.data}');
//           print(response.statusCode);
//         }
//         Customsnackbar.showSnackBar(context, "Success",
//             "Patient registerd successfully", AppColor.green);
//       } else {
//         Customsnackbar.showSnackBar(
//             context, "Failed", "Patient registration failed!", Colors.red);
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }
// }
