import 'package:firebase_app1/dashboard.dart';
import 'package:firebase_app1/kubernetes/deployment.dart';
import 'package:flutter/material.dart';

class Create_dash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Pods & Deployments',
            style: TextStyle(
              fontSize: 22.0,
              color: Colors.tealAccent[700],
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Landing_Kubernetes();
              }));
            },
          ),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(border: Border.all()),
                child: ConstrainedBox(
                  constraints: BoxConstraints.expand(
                    height: 350.0,
                    width: double.infinity,
                  ),
                  child: FlatButton(
                    onLongPress: () {},
                    onPressed: () {},
                    child: Image.asset(
                      'assets/cluster.png',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 1.0,
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.only(top: 40),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          child: Text(
                            'Pods',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w900,
                              color: Colors.tealAccent[700],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                            child: ConstrainedBox(
                                constraints: BoxConstraints.expand(
                                  height: 200.0,
                                  width: 190.0,
                                ),
                                child: RaisedButton(
                                    focusColor: Colors.tealAccent,
                                    highlightColor: Colors.tealAccent,
                                    onPressed: () {},
                                    child: Image.asset('assets/pods2.png')))),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          child: Text(
                            'Deployments',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w900,
                              color: Colors.tealAccent[700],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                            child: ConstrainedBox(
                                constraints: BoxConstraints.expand(
                                  height: 200.0,
                                  width: 190.0,
                                ),
                                child: RaisedButton(
                                  highlightColor: Colors.black,
                                  onPressed: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return Deployment();
                                    }));
                                  },
                                  child: Image.asset('assets/deployment.png'),
                                ))),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
    );
    return Create_dash();
  }
}
