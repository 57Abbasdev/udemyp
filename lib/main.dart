import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final audioplayer = AudioPlayer();
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    var filename = 'files/gol.mp3';
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              //Todo: Audio Player not working
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
                      await audioplayer.pause();
                    } else {
                      String url = "files/pyar.mp3";
                      //await audioplayer.se;
                    }

                    // audioplayer.setSource(AssetSource('files/pyar.mp3'));
                    //player.seek(Duration(seconds: 1200));
                    //print(player.toString());
                  },
                  child: Icon(Icons.play_arrow),
                ),
              ],
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    //player.play(filename);
                  },
                  child: Icon(Icons.quiz),
                ),
              ],
            ),
          ],
        ),
      ),
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
