import 'package:firebase_app1/dashboard.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Expose extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: HomePage(),
    );
    return Expose();
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var webdata;
  String name;
  var cat, type, number;

  web(cat, name, type, number) async {
    var url =
        "http://192.168.43.38/cgi-bin/kubernetes/expose.py?x=${cat}&y=${name}&z=${type}&a=${number}";
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
          "Kubernetes_remove",
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
                  cat = value1;
                },
                decoration: InputDecoration(
                    labelText: 'What you want to expose?',
                    hintText: 'eg. pod,all,deployment,rs',
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
                  name = value2;
                },
                decoration: InputDecoration(
                    labelText: 'Name',
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
                onChanged: (value1) {
                  type = value1;
                },
                decoration: InputDecoration(
                    labelText: 'Enter type',
                    hintText: 'eg. NodePort,ClusterIP',
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
                onChanged: (value1) {
                  number = value1;
                },
                decoration: InputDecoration(
                    labelText: 'Enter_port',
                    hintText: 'eg. 80',
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
                  web(cat, name, type, number);
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
