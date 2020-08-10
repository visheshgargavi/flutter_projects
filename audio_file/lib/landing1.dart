import 'package:audio_file/audio/offline.dart';
import 'package:audio_file/audio/online.dart';
import 'package:audio_file/navigation.dart';
import 'package:flutter/material.dart';

class landing1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "landingpage",
      theme: ThemeData.dark(),
      home: HomePage(),
    );
    return landing1();
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text(
              "AUDIO_PLAYER",
              style: TextStyle(
                  color: Colors.yellow[600],
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700),
            ),
            backgroundColor: Colors.grey[900],
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context, MaterialPageRoute(builder: (context) {
                    return Navigation();
                  }));
                })),
        body: Center(
          child: ListView(
            padding: EdgeInsets.fromLTRB(20.0, 100, 20.0, 100.0),
            children: <Widget>[
              ListTile(
                title: Text(
                  "MY_MUSIC",
                  style: TextStyle(
                      color: Colors.yellow[600],
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700),
                ),
                subtitle: Text(
                  "offline music",
                  style: TextStyle(
                    color: Colors.tealAccent,
                  ),
                ),
                leading: Icon(Icons.library_music),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return offlineaudio();
                  }));
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: double.infinity,
                height: 300,
                child: Image(
                  image: AssetImage("assets/choose.jpg"),
                ),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              ListTile(
                title: Text(
                  "ONLINE_MUSIC",
                  style: TextStyle(
                      color: Colors.yellow[600],
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700),
                ),
                subtitle: Text(
                  "online music",
                  style: TextStyle(
                    color: Colors.tealAccent,
                  ),
                ),
                leading: Icon(Icons.music_note),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return onlineaudio();
                  }));
                },
              ),
            ],
          ),
        ),
        backgroundColor: Colors.grey[700],
      ),
    );
  }
}
