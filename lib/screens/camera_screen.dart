// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'dart:math' as math;

// import '../realtime_detect/bounding_box.dart';
// import '../realtime_detect/camera.dart';

// class CameraScreen extends StatefulWidget {
//   const CameraScreen({
//     super.key,
//     required this.model,
//     required this.recognitions,
//     required this.cameras,
//   });

//   final List<CameraDescription> cameras;
//   final List<dynamic>? recognitions;
//   final int imageHeight = 0;
//   final int imageWidth = 0;
//   final String model;

//   @override
//   State<CameraScreen> createState() => _CameraScreenState();
// }

// class _CameraScreenState extends State<CameraScreen> {
//   setRecognitions(recognitions, imageHeight, imageWidth) {
//     setState(() {
//       recognitions = recognitions;
//       imageHeight = imageHeight;
//       imageWidth = imageWidth;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size screen = MediaQuery.of(context).size;
//     return Scaffold(
//       body: Stack(
//         children: [
//           Camera(
//             widget.cameras,
//             widget.model,
//             setRecognitions,
//           ),
//           BndBox(
//             widget.recognitions == null ? [] : widget.recognitions!,
//             // _recognitions ?? [],
//             math.max(widget.imageHeight, widget.imageWidth),
//             math.min(widget.imageHeight, widget.imageWidth),
//             screen.height,
//             screen.width,
//             widget.model,
//           ),
//           GestureDetector(
//             child: Container(
//               margin: const EdgeInsets.all(20),
//               padding: const EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 color: Colors.black26,
//                 borderRadius: BorderRadius.circular(40),
//               ),
//               child: const Icon(
//                 Icons.arrow_back,
//                 size: 40,
//               ),
//             ),
//             onTap: () {
//               print("Reset");
//               widget.model == "";
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
