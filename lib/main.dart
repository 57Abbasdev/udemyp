import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:udemyp/bmiapp/bmi_main.dart';
import 'package:udemyp/quizapp/quiz.dart';

import 'clima/climaMain.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    var filename = 'files/gol.mp3';
    return MaterialApp(
      home: Scaffold(appBar: AppBar(), body: MyBody()),
    );
  }
}

class MyBody extends StatelessWidget {
  MyBody({Key? key}) : super(key: key);

  final audioPlayer = AudioPlayer();
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //Todo: Audio Player not working
        Column(

          children: [
            Slider(
                value: position.inSeconds.toDouble(),
                min: 0,
                onChanged: (value) async {}),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(formatTime(position)),
                Text(formatTime(duration - position)),
              ],
            ),
            ElevatedButton(
              onPressed: () async {
                if (isPlaying) {
                  await audioPlayer.pause();
                } else {
                  String url = "files/pyar.mp3";
                  //await audioplayer.se;
                }

                // audioplayer.setSource(AssetSource('files/pyar.mp3'));
                //player.seek(Duration(seconds: 1200));
                //print(player.toString());
              },
              child: const Icon(Icons.play_arrow),
            ),
          ],
        ),

        // buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () {
                print("quiz");
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const Quiz()));
              },
              child: const Text("Quiz"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const BmiMain()));
              },
              child: const Text("Bmi Calculator"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const ClimaMain()));
              },
              child: const Text("Clima App"),
            ),
          ],
        ),
      ],
    );
  }

  String formatTime(Duration duration) {
    String twoDigits(int m) => m.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }
}
