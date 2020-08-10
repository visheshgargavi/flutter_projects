import 'package:audio_file/landing1.dart';
import 'package:audio_file/landing2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Navigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Lt. SSR",
            style: TextStyle(fontSize: 20.0),
          ),
          backgroundColor: Colors.grey[900],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0, // this will be set when a new tab is tapped
          items: [
            BottomNavigationBarItem(
              icon: new IconButton(
                  icon: Icon(Icons.audiotrack),
                  color: Colors.grey[900],
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return landing1();
                    }));
                  }),
              title: new Text(
                'AUDIO',
                style: TextStyle(fontSize: 20.0, color: Colors.grey[900]),
              ),
            ),
            BottomNavigationBarItem(
              icon: new IconButton(
                  icon: Icon(Icons.video_label),
                  color: Colors.grey[900],
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return landing2();
                    }));
                  }),
              title: new Text(
                'VIDEO',
                style: TextStyle(fontSize: 25.0, color: Colors.grey[900]),
              ),
            ),
          ],
        ),
        body: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: double.infinity,
          color: Colors.grey[700],
          margin: EdgeInsets.all(10),
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[700],
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: Colors.black,
                    width: 3.0,
                  ),
                ),
                margin: EdgeInsets.all(50.0),
                alignment: Alignment.center,
                height: 150,
                width: 300,
                //color: Colors.teal,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "VISHESH GARG",
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.white70,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.email),
                        Text("   Vishesh8199@gmail.com"),
                      ],
                    ),
                  ],
                ),
              ),
              GestureDetector(
                //onTap: myprint,
                onDoubleTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://raw.githubusercontent.com/visheshgargavi/flutter_class/master/pic1.jpeg"),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: Colors.black,
                      width: 3.0,
                    ),
                  ),
                  //padding: EdgeInsets.all(30.0),
                  //padding: EdgeInsets.only(left: 13.0),
                  height: 100,
                  width: 100,
                  //color: Colors.teal,
                  //child: Text('Container2'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
