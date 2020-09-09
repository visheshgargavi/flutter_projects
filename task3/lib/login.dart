import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class MyLogin extends StatefulWidget {
  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  var x = FirebaseAuth.instance;
  var email;
  var password;
  bool show_spinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: ModalProgressHUD(
        inAsyncCall: show_spinner,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Enter email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                  ),
                  onChanged: (value) {
                    email = value;
                    print(email);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Enter password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                  ),
                  onChanged: (value) {
                    password = value;
                    print(password);
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  width: 290,
                  child: RaisedButton(
                    child: Text("Submit"),
                    onPressed: () async {
                      try {
                        var user = await x.signInWithEmailAndPassword(
                            email: email, password: password);
                        print(email);
                        print(password);
                        print(user);
                        if (user != null) {
                          Navigator.pushNamed(context, "chat");
                          setState(() {
                            show_spinner = true;
                          });
                        }
                      } catch (e) {
                        print(e);
                      }
                      ;
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
