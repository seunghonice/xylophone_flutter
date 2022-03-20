import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  final player = AudioCache();
  final _colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("실로폰이다임마"),
        ),
        body: SafeArea(
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                keyButton(number: 1),
                keyButton(number: 2),
                keyButton(number: 3),
                keyButton(number: 4),
                keyButton(number: 5),
                keyButton(number: 6),
                keyButton(number: 7),
                keyButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget keyButton({int number = 1}) => Expanded(
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateColor.resolveWith(
                  (states) => _colors[number - 1])),
          onPressed: () {
            _playNote(number);
          },
        ),
      );

  void _playNote(int number) {
    player.play('note$number.wav');
  }
}
