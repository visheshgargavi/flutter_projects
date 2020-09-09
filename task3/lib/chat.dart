import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class MyChat extends StatefulWidget {
  @override
  _MyChatState createState() => _MyChatState();
}

class _MyChatState extends State<MyChat> {
  String msg;

  var fs = FirebaseFirestore.instance;
  var authc = FirebaseAuth.instance;

  getmsglive() async {
    await for (var ss in fs.collection("message").snapshots()) {
      for (var doc in ss.docs) {
        print(doc.data());
      }
    }
  }

  @override
  void initState() {
    print("landed to chat page");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chatting App"),
        actions: [
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                try {
                  print("sign off");
                  authc.signOut();
                  Navigator.pushNamed(context, "login");
                } catch (e) {}
              }),
        ],
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) async {
              msg = value;
            },
          ),
          RaisedButton(
            onPressed: () async {
              var getmsg = await fs.collection("message").add({
                "user": authc.currentUser.email,
                "msg": msg,
              });
            },
            child: Text("send"),
          ),
          FlatButton(
            onPressed: () {
              getmsglive();
            },
            child: Text("live"),
          ),
          RaisedButton(
            onPressed: () async {
              var msgdoc = await fs.collection("message").get();
              //print(msgdoc.docs[0].data());
              for (var i in msgdoc.docs) {
                print(i.data());
              }
            },
            child: Text("Get_data"),
          ),
          RaisedButton(
            onPressed: () {
              var user = authc.currentUser;
              print(user.email);
            },
            child: Text("click here to know the current user"),
          ),
        ],
      ),
    );
  }
}
