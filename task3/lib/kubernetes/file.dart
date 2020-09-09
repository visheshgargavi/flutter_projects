import 'package:firebase_app1/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class File extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: HomePage(),
    );
    return File();
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var webdata;
  String name;
  var image, file, dir, add, path1, re, version;

  web(dir) async {
    var url = "http://192.168.43.38/cgi-bin/kubernetes/dir.py?x=${dir}";
    var response = await http.get(url);
    setState(() {
      webdata = response.body;
    });
    print(webdata);
  }

  web1(file) async {
    var url = "http://192.168.43.38/cgi-bin/kubernetes/file.py?x=${file}";
    var response = await http.get(url);
    setState(() {
      webdata = response.body;
    });
    print(webdata);
  }

  web2(add) async {
    var url = "http://192.168.43.38/cgi-bin/kubernetes/add.py?x=${add}";
    var response = await http.get(url);
    setState(() {
      webdata = response.body;
    });
    print(webdata);
  }

  web3() async {
    var url = "http://192.168.43.38/cgi-bin/kubernetes/create_file.py";
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
          "DockerFile",
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
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.zero,
                  color: Colors.white,
                ),
                child: Text(
                  '              Run Basic Commands             ',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.orange[300],
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                autocorrect: true,
                onChanged: (value1) {
                  dir = value1;
                },
                decoration: InputDecoration(
                    labelText: 'Basic_commands',
                    hintText: 'eg. cat,ls,ps',
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
                  web(dir);
                },
                child: Text(
                  'submit',
                  style: TextStyle(fontSize: 20.0),
                ),
                color: Colors.tealAccent,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.zero,
                  color: Colors.white,
                ),
                child: Text(
                  '  Update content into the yaml file  ',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.orange[300],
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                autocorrect: true,
                onChanged: (value1) {
                  add = value1;
                },
                decoration: InputDecoration(
                    labelText: 'Add_content',
                    hintText: 'eg. apiVersion: v1',
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
                  web2(add);
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
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.zero,
                  color: Colors.white,
                ),
                child: Text(
                  '           To create new dockerfile            ',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.orange[300],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                autocorrect: true,
                onChanged: (value2) {
                  file = value2;
                },
                decoration: InputDecoration(
                    labelText: 'To_add_new_content',
                    hintText: 'from scratch',
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
                  web1(file);
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
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.zero,
                  color: Colors.white,
                ),
                child: Text(
                  '                To run a file                ',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.orange[300],
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              FlatButton(
                onPressed: () {
                  web3();
                },
                child: Text(
                  'submit',
                  style: TextStyle(fontSize: 20.0),
                ),
                color: Colors.tealAccent,
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
