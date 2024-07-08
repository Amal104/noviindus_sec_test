import 'dart:io';

import 'package:flutter/material.dart';
import 'package:noviindus_sec_test/Provider/AddFeed_Provider.dart';
import 'package:provider/provider.dart';

class UploadPage extends StatefulWidget {
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Video and Image'),
      ),
      body: Center(
        child: Consumer<AddfeedProvider>(
          builder: (context, value, child) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: value.pickVideo,
                child: Text('Pick Video'),
              ),
              ElevatedButton(
                onPressed: value.pickImage,
                child: Text('Pick Image'),
              ),
              ElevatedButton(
                onPressed: value.uploadFiles,
                child: Text('Upload Files'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
