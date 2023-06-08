import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

final FlutterTts tts = FlutterTts();

Future _speak({required String keyword}) async {
  tts.setLanguage('en-US');
  tts.setSpeechRate(0.4);
  tts.setVolume(1.0);
  tts.setPitch(1.0);
  tts.speak(keyword);
}

Future<void> showWordDialog({
  required BuildContext context,
  required String keyword,
}) async {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              keyword,
              style: const TextStyle(
                fontSize: 36,
                color: Colors.red,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 16),
            IconButton(
              icon: const Icon(
                Icons.volume_up,
                size: 30,
                color: Colors.blue,
              ),
              onPressed: () => _speak(keyword: keyword),
            ),
          ],
        ),
        actions: [
          TextButton(
            child: Text(
              "Close",
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}
