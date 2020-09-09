import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Material(
              child: MaterialButton(
                child: Text("Reg"),
                onPressed: () {
                  Navigator.pushNamed(context, "reg");
                },
                minWidth: 200,
                height: 40.0,
              ),
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.circular(10),
              elevation: 10.0,
            ),
            SizedBox(
              height: 20.0,
            ),
            Material(
              child: MaterialButton(
                child: Text("Login"),
                onPressed: () {
                  Navigator.pushNamed(context, "login");
                },
                minWidth: 200,
                height: 40.0,
              ),
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.circular(10),
              elevation: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
