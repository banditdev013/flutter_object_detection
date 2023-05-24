import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:object_detection/screens/splash_screen.dart';

List<CameraDescription>? cameras;
Future<void> main() async {
  // initialize the cameras when the app starts
  WidgetsFlutterBinding.ensureInitialized();
  try {
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print('Error: $e.code\nError Message: $e.message');
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Object Detection',
      theme: ThemeData.dark(),
      home: SplashScreen(cameras: cameras!),
    );
  }
}
