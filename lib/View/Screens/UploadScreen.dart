import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../Utils/Appcolor.dart';

class AddFeedsPage extends StatefulWidget {
  @override
  _AddFeedsPageState createState() => _AddFeedsPageState();
}

class _AddFeedsPageState extends State<AddFeedsPage> {
  final ImagePicker _picker = ImagePicker();
  XFile? _selectedVideo;
  XFile? _selectedImage;

  Future<void> _pickVideo() async {
    final video = await _picker.pickVideo(source: ImageSource.gallery);
    setState(() {
      _selectedVideo = video;
    });
  }

  Future<void> _pickImage() async {
    final image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _selectedImage = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.arrow_back_ios,
                        color: AppColor.white,
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 2,
              ),
              CustomPaint(
                painter: DottedBorderPainter(),
                child: GestureDetector(
                  onTap: _pickVideo,
                  child: Container(
                    height: 150,
                    child: Center(
                      child: _selectedVideo == null
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.video_library, size: 50),
                                SizedBox(height: 8),
                                Text('Select a video from Gallery'),
                              ],
                            )
                          : Text('Video Selected: ${_selectedVideo!.name}'),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              CustomPaint(
                painter: DottedBorderPainter(),
                child: GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    height: 150,
                    child: Center(
                      child: _selectedImage == null
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.image, size: 50),
                                SizedBox(height: 8),
                                Text('Add a Thumbnail'),
                              ],
                            )
                          : Text('Image Selected: ${_selectedImage!.name}'),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text('Add Description'),
              TextField(
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: 'Enter your description here...',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              Text('Categories This Project'),
              Wrap(
                spacing: 8.0,
                children: [
                  Chip(label: Text('Physics')),
                  Chip(label: Text('Artificial Intelligence')),
                  Chip(label: Text('Mathematics')),
                  Chip(label: Text('Chemistry')),
                  Chip(label: Text('Micro Biology')),
                  Chip(label: Text('Lorem ipsum dolor sit gre')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DottedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final Path path = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height));

    final dashWidth = 5.0;
    final dashSpace = 5.0;
    double distance = 0.0;

    for (PathMetric pathMetric in path.computeMetrics()) {
      while (distance < pathMetric.length) {
        canvas.drawPath(
          pathMetric.extractPath(distance, distance + dashWidth),
          paint,
        );
        distance += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
