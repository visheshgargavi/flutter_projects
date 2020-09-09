import 'package:firebase_app1/Screens/signup.dart';
import 'package:firebase_app1/landing.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Login extends StatelessWidget {
  var authc = FirebaseAuth.instance;
  var email;
  var password;
  bool show_spinner = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ModalProgressHUD(
        inAsyncCall: show_spinner,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Innovation_Skyline'),
            backgroundColor: Colors.teal,
            centerTitle: true,
            leading: Image.network(
              'https://raw.githubusercontent.com/visheshgargavi/flutter_class/master/pic1.jpeg',
              width: double.infinity,
              height: double.infinity,
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.email),
                onPressed: () {
                  print("someone clicked");
                },
              ),
            ],
          ),
          body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  //width: double.infinity,
                  //height: double.infinity,
                  // color: Colors.grey,
                  margin: EdgeInsets.all(10),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[600],
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
                          height: 100,
                          width: 100,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                    onChanged: (value) {
                      email = value;
                      print(email);
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                    onChanged: (value) {
                      password = value;
                      print(password);
                    },
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    //forgot_password
                  },
                  child: Text('Forgot Password'),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: RaisedButton(
                    onPressed: () async {
                      try {
                        var user = await authc.signInWithEmailAndPassword(
                            email: email, password: password);
                        print(email);
                        print(password);
                        print(user);
                        if (user != null) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Landing();
                          }));
                          setState() {
                            show_spinner = true;
                          }
                        }
                      } catch (e) {
                        print(e);
                      }
                      ;
                    },
                    textColor: Colors.white,
                    color: Colors.teal,
                    child: Text('Login'),
                  ),
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Text('Does not have an account?'),
                      FlatButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return SignUp();
                          }));
                        },
                        child: Text(
                          'SIGN UP',
                          style: TextStyle(
                            fontSize: 20.0,
                            backgroundColor: Colors.tealAccent[300],
                          ),
                        ),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
    return Login();
  }
}
