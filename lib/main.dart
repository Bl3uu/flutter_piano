import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(const PianoApp());

Expanded whiteKeys(int A){
  return Expanded(
    child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          shape: BeveledRectangleBorder(borderRadius: BorderRadius.zero),
        ),
        onPressed: (){
          final player = AudioPlayer();
          player.play(AssetSource('note$A.wav'));
        },
        child: Container(
        )
    ),
  );
}

Positioned blackKey(int noteNumber, double bottomPosition) {
  return Positioned(
    bottom: bottomPosition,
    right: 0,
    child: SizedBox(
      width: 250,
      height: 60,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.black,
          shape: BeveledRectangleBorder(borderRadius: BorderRadius.zero),
        ),
        onPressed: () {
          final player = AudioPlayer();
          player.play(AssetSource('note$noteNumber.wav'));
        },
        child: Container(),
      ),
    ),
  );
}

class PianoApp extends StatelessWidget {
  const PianoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  whiteKeys(1),
                  whiteKeys(3),
                  whiteKeys(5),
                  whiteKeys(6),
                  whiteKeys(8),
                  whiteKeys(10),
                  whiteKeys(12),
                ],
              ),
              blackKey(2, 60),
              blackKey(4, 160),
              blackKey(7, 255),
              blackKey(9, 440),
              blackKey(11, 535)
            ],
          ),
        ),
      ),
    );
  }
}