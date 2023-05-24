import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:object_detection/consts.dart';
import 'package:object_detection/main.dart';
import 'package:object_detection/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required this.cameras});
  final List<CameraDescription> cameras;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    _isLoading = true;
    Timer(const Duration(seconds: 3), () {
      setState(() {
        _isLoading == false;
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(
            cameras: cameras!,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kprimary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Object\nDetection",
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                // color: Colors.greenAccent.shade200,
                color: Colors.lightBlueAccent,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            Image.asset(
              "assets/images/logo/scan.png",
              width: 250,
            ),
            const SizedBox(height: 40),
            _isLoading == true
                ? const Center(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: CircularProgressIndicator(),
                    ),
                  )
                : const Center()
          ],
        ),
      ),
    );
  }
}
