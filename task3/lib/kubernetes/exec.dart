import 'package:firebase_app1/dashboard.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Exec extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: HomePage(),
    );
    return Exec();
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var webdata;
  String name;
  var delete;
  var xyz;

  web(name, delete, xyz) async {
    var url =
        "http://192.168.43.38/cgi-bin/kubernetes/exec.py?x=${name}&y=${delete}&z=${xyz}";
    var response = await http.get(url);
    setState(() {
      webdata = response.body;
    });
    print(webdata);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Kubernetes_exec",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w900,
          ),
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              setState(() {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Landing_Kubernetes();
                }));
              });
            }),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextFormField(
                autocorrect: true,
                onChanged: (value1) {
                  name = value1;
                },
                decoration: InputDecoration(
                    labelText: 'Enter_name',
                    hintText: 'eg. myweb,mydeploy',
                    errorStyle:
                        TextStyle(color: Colors.yellowAccent, fontSize: 15.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                autocorrect: true,
                onChanged: (value2) {
                  delete = value2;
                },
                decoration: InputDecoration(
                    labelText: 'Enter_command',
                    hintText: 'eg. cd,yum install,ls',
                    errorStyle:
                        TextStyle(color: Colors.yellowAccent, fontSize: 15.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                autocorrect: true,
                onChanged: (value2) {
                  xyz = value2;
                },
                decoration: InputDecoration(
                    labelText: 'Location_or_software',
                    hintText: 'eg. /var/www/html/ or httpd -y',
                    errorStyle:
                        TextStyle(color: Colors.yellowAccent, fontSize: 15.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
              SizedBox(
                height: 10.0,
              ),
              FlatButton(
                onPressed: () {
                  web(name, delete, xyz);
                },
                child: Text(
                  'submit',
                  style: TextStyle(fontSize: 20.0),
                ),
                color: Colors.tealAccent,
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.all(10),
                color: Colors.white,
                child: Text(
                  webdata ?? "MAKE_IN_INDIA",
                  style: TextStyle(
                    fontSize: 10.0,
                    color: Colors.teal[900],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
