import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class onlineaudio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    );
    return onlineaudio();
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AudioPlayer audioPlayer = new AudioPlayer();
  Duration duration = new Duration();
  Duration position = new Duration();
  bool playing = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ONLINE_AUDIO"),
        backgroundColor: Colors.grey[900],
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10.0),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                height: 200,
                child: Image(
                  image: AssetImage(
                    "assets/jaan.jpg",
                  ),
                ),
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.grey[700]),
              ),
              slider(),
              InkWell(
                onTap: () {
                  getAudio();
                },
                child: Icon(
                  playing == false
                      ? Icons.play_circle_outline
                      : Icons.pause_circle_outline,
                  size: 100.0,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.grey[700],
    );
  }

  Widget slider() {
    return Slider.adaptive(
      activeColor: Colors.grey[700],
      inactiveColor: Colors.grey[700],
      min: 0.0,
      value: position.inSeconds.toDouble(),
      max: duration.inSeconds.toDouble(),
      onChanged: (double value) {
        setState(() {
          audioPlayer.seek(new Duration(seconds: value.toInt()));
        });
      },
    );
  }

  void getAudio() async {
    var url =
        "https://raw.githubusercontent.com/aaditya2801/myflutter/master/Major_Lazer_feat._MO_DJ_Snake_-_Lean_On.mp3";
    if (playing) {
      var res = await audioPlayer.pause();
      if (res == 1) {
        setState(() {
          playing = false;
        });
      }
    } else {
      var res = await audioPlayer.play(url, isLocal: true);
      if (res == 1) {
        setState(() {
          playing = true;
        });
      }
    }
    audioPlayer.onDurationChanged.listen((Duration dd) {
      setState(() {
        duration = dd;
      });
    });
    audioPlayer.onAudioPositionChanged.listen((Duration dd) {
      setState(() {
        position = dd;
      });
    });
  }
}
