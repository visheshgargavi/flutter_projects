import 'package:audio_file/audio/offline.dart';
import 'package:audio_file/video/offline.dart';
import 'package:audio_file/video/online.dart';
import 'package:flutter/material.dart';

class landing2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "landingpage",
      theme: ThemeData.dark(),
      home: HomePage(),
    );
    return landing2();
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
                  Navigator.pop(context);
                })),
        body: Center(
          child: ListView(
            padding: EdgeInsets.fromLTRB(20.0, 100, 20.0, 100.0),
            children: <Widget>[
              ListTile(
                title: Text(
                  "MY_VIDEO",
                  style: TextStyle(
                      color: Colors.yellow[600],
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700),
                ),
                subtitle: Text(
                  "offline video",
                  style: TextStyle(
                    color: Colors.tealAccent,
                  ),
                ),
                leading: Icon(Icons.personal_video),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return VideoOffline();
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
                  "ONLINE_VIDEO",
                  style: TextStyle(
                      color: Colors.yellow[600],
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700),
                ),
                subtitle: Text(
                  "online video",
                  style: TextStyle(
                    color: Colors.tealAccent,
                  ),
                ),
                leading: Icon(Icons.ondemand_video),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return VideoOnline();
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
