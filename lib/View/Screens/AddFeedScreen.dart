import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path/path.dart' as path;
import 'package:http_parser/http_parser.dart';

class ApiService {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://your-api-endpoint.com/api/upload';
  final String _bearerToken = 'your-bearer-token';

  Future<void> uploadFile(File videoFile, File imageFile) async {
    try {
      // Create a FormData object
      FormData formData = FormData();

      // Add the video file
      formData.files.add(
        MapEntry(
          "video",
          await MultipartFile.fromFile(
            videoFile.path,
            filename: path.basename(videoFile.path),
            contentType: MediaType('video', 'mp4'),
          ),
        ),
      );

      // Add the image file
      formData.files.add(
        MapEntry(
          "image",
          await MultipartFile.fromFile(
            imageFile.path,
            filename: path.basename(imageFile.path),
            contentType: MediaType('image', 'jpeg'),
          ),
        ),
      );

      // Make the POST request
      Response response = await _dio.post(
        _baseUrl,
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $_bearerToken',
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      if (response.statusCode == 200) {
        print('Upload successful: ${response.data}');
      } else {
        print('Upload failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Upload error: $e');
    }
  }
}

class UploadPage extends StatefulWidget {
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  final ApiService _apiService = ApiService();
  final ImagePicker _picker = ImagePicker();
  File? _videoFile;
  File? _imageFile;

  Future<void> _pickVideo() async {
    final pickedFile = await _picker.pickVideo(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _videoFile = File(pickedFile.path);
      });
    }
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  Future<void> _uploadFiles() async {
    if (_videoFile != null && _imageFile != null) {
      await _apiService.uploadFile(_videoFile!, _imageFile!);
    } else {
      print('Please select both video and image files.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Video and Image'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _pickVideo,
              child: Text('Pick Video'),
            ),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Pick Image'),
            ),
            ElevatedButton(
              onPressed: _uploadFiles,
              child: Text('Upload Files'),
            ),
          ],
        ),
      ),
    );
  }
}