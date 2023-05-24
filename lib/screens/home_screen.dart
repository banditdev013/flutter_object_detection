import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:object_detection/consts.dart';
// import 'package:object_detection/screens/camera_screen.dart';
import 'package:tflite/tflite.dart';
import 'dart:math' as math;

import '../realtime_detect/bounding_box.dart';
import '../realtime_detect/camera.dart';

class HomeScreen extends StatefulWidget {
  final List<CameraDescription> cameras;

  const HomeScreen({super.key, required this.cameras});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic>? _recognitions;
  int _imageHeight = 0;
  int _imageWidth = 0;
  String _model = "";

  @override
  void initState() {
    super.initState();
  }

  loadModel() async {
    String? res;
    res = await Tflite.loadModel(
      // เปลี่ยนโมเดลตรงนี้
      model: "assets/models/ssd_mobilenet.tflite",
      labels: "assets/models/ssd_mobilenet.txt",
    );
    print(res);
  }

  onSelect(model) {
    setState(() {
      _model = model;
    });
    loadModel();
  }

  resetModel() {
    setState(() {
      _model = "";
    });
  }

  setRecognitions(recognitions, imageHeight, imageWidth) {
    setState(() {
      _recognitions = recognitions;
      _imageHeight = imageHeight;
      _imageWidth = imageWidth;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kprimary,
      body: _model == ""
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 30,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      backgroundColor: Colors.lightBlueAccent,
                    ),
                    child: const Text(
                      "DETECT",
                      style: TextStyle(
                        fontSize: 30,
                        // color: kprimary,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () => onSelect(ssd),
                  ),
                ],
              ),
            )
          : Stack(
              children: [
                Camera(
                  widget.cameras,
                  _model,
                  setRecognitions,
                ),
                BndBox(
                  _recognitions == null ? [] : _recognitions!,
                  // _recognitions ?? [],
                  math.max(_imageHeight, _imageWidth),
                  math.min(_imageHeight, _imageWidth),
                  screen.height,
                  screen.width,
                  _model,
                ),
                GestureDetector(
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      size: 40,
                    ),
                  ),
                  onTap: () {
                    // print("Reset");
                    resetModel();
                  },
                ),
              ],
            ),
      // : CameraScreen(
      //     model: model,
      //     cameras: widget.cameras,
      //     recognitions: recognitions,
      //   ),
    );
  }
}
