import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app1/landing.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String query;

var i = 0;

class Terminal extends StatefulWidget {
  @override
  _TerminalState createState() => _TerminalState();
}

class _TerminalState extends State<Terminal> {
  AppBar appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      title: Text(
        "Linux Terminal",
      ),
      centerTitle: true,
      leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Landing();
            }));
          }),
      actions: <Widget>[
        PopupMenuButton<int>(
          icon: Icon(Icons.more_vert),
          itemBuilder: (BuildContext context) {
            return <PopupMenuEntry<int>>[
              PopupMenuItem(
                value: 0,
                child: Text('Share'),
              ),
              PopupMenuItem(
                value: 1,
                child: Text('Feedback'),
              ),
              PopupMenuItem(
                value: 2,
                child: Text('Downloads'),
              ),
              PopupMenuItem(
                value: 2,
                child: Text('Contact us'),
              ),
              PopupMenuItem(
                value: 3,
                child: Text('FAQ'),
              ),
            ];
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: appBar(context),
      body: ListOfDockerImagesBody(),
    );
  }
}

class ListOfDockerImagesBody extends StatefulWidget {
  @override
  _ListOfDockerImagesBodyState createState() => _ListOfDockerImagesBodyState();
}

class _ListOfDockerImagesBodyState extends State<ListOfDockerImagesBody> {
  var cmd;
  var webdata;
  var query, display = "";

  myweb(cmd) async {
    var url = "http://192.168.43.38/cgi-bin/kubernetes/basic.py?x=${cmd}";
    var r = await http.get(url);
    setState(() {
      webdata = r.body;
    });

    setState(() {
      display += "[root@localhost ~]# " + cmd + "\n" + webdata + "\n";
    });
  }

  String msg;

  var authc = FirebaseAuth.instance;
  var fsconnect = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
          minimum: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5),
          child: Container(
            child: Column(
              children: <Widget>[
                Container(),
                const SizedBox(height: 10),
                Column(
                  children: <Widget>[
                    Card(
                      color: Colors.grey[800],
                      child: Container(
                        padding: EdgeInsets.only(left: 5, right: 4),
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              title: Text(
                                "Terminal",
                              ),
                              trailing: Icon(
                                Icons.refresh,
                                color: Colors.white,
                              ),
                              onTap: () => {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Terminal();
                                }))
                              },
                            ),
                            _divider(),
                            SingleChildScrollView(
                              child: Container(
                                width: 400,
                                padding: EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  color: Colors.grey[800],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                ),
                                child: Text(
                                  display ?? "Output",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.tealAccent,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  "[root@localhost ~]# ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.tealAccent,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  width: 200,
                                  height: 60,
                                  padding: EdgeInsets.only(top: 4),
                                  child: TextField(
                                    onChanged: (val) {
                                      query = val;
                                    },
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.amber),
                                    decoration: InputDecoration(),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            RaisedButton(
                              onPressed: () async {
                                await myweb(query);
                                print(webdata);
                                fsconnect.collection('message').add({
                                  "user": authc.currentUser.email,
                                  "output": webdata ?? 'make in india',
                                });
                                i = i + 1;
                              },
                              textColor: Colors.black,
                              padding: const EdgeInsets.all(0.0),
                              child: Container(
                                child: const Text(
                                  'Submit',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              color: Colors.tealAccent,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}

Widget _divider() {
  return Container(
    child: Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Divider(
              color: Colors.tealAccent,
              thickness: 1,
            ),
          ),
        ),
      ],
    ),
  );
}
