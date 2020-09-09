import 'package:firebase_app1/basic/baisc1.dart';
import 'package:firebase_app1/dashboard.dart';
import 'package:flutter/material.dart';

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: HomePage(),
    );
    return Landing();
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "INNOVATIVE_SKYLINE",
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.tealAccent,
            fontWeight: FontWeight.w900,
          ),
        ),
        backgroundColor: Colors.grey[900],
      ),
      body: Center(
        child: Container(
          color: Colors.black,
          child: ListView(
            padding: EdgeInsets.fromLTRB(20.0, 100, 20.0, 100.0),
            children: <Widget>[
              ListTile(
                  title: Text(
                    "REDHAT_8.0",
                    style: TextStyle(
                        color: Colors.yellow[600],
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700),
                  ),
                  subtitle: Text(
                    "eg. date,cal,ifconfig,docker ps",
                    style: TextStyle(
                      color: Colors.tealAccent,
                    ),
                  ),
                  leading: IconButton(
                      icon: Icon(Icons.code),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Terminal();
                        }));
                      })),
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
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              ListTile(
                title: Text(
                  "Kubernetes",
                  style: TextStyle(
                      color: Colors.yellow[600],
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700),
                ),
                subtitle: Text(
                  "eg. kubectl get pods",
                  style: TextStyle(
                    color: Colors.tealAccent,
                  ),
                ),
                leading: Icon(Icons.desktop_windows),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Landing_Kubernetes();
                  }));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
