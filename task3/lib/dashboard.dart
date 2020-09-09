import 'package:firebase_app1/Screens/login.dart';
import 'package:firebase_app1/kubernetes/createdash.dart';
import 'package:firebase_app1/kubernetes/delete.dart';
import 'package:firebase_app1/kubernetes/describe.dart';
import 'package:firebase_app1/kubernetes/exec.dart';
import 'package:firebase_app1/kubernetes/expose.dart';
import 'package:firebase_app1/kubernetes/file.dart';
import 'package:firebase_app1/kubernetes/get.dart';
import 'package:firebase_app1/kubernetes/scale.dart';
import 'package:firebase_app1/landing.dart';
import 'package:flutter/material.dart';

class Landing_Kubernetes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFFFFC107),
        dividerColor: Colors.white,
      ),
      home: DashboardScreen(),
    );
    return Landing_Kubernetes();
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kubernetes DashBoard',
          style: TextStyle(
            fontSize: 22.0,
            color: Colors.tealAccent[700],
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Landing();
            }));
          },
        ),
        actions: <Widget>[
          PopupMenuButton<int>(
            icon: Icon(Icons.more_vert),
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry<int>>[
                PopupMenuItem(
                  value: 0,
                  child: RaisedButton(
                    child: Text('Logout'),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Login();
                      }));
                    },
                  ),
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
      ),
      body: IconTheme.merge(
        data: IconThemeData(
            //color: Theme.of(context).primaryColor,
            ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Icon(Icons.account_circle,
                              size: 72.0, color: Colors.white),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Vishesh Garg',
                                style:
                                    const TextStyle(color: Colors.tealAccent),
                              ),
                              Text(
                                'vishesh8199@gmail.com',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.tealAccent),
                              ),
                              Text(
                                '+919784798958',
                                style: const TextStyle(
                                  color: Colors.tealAccent,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text('  '),
                            Text(''),
                            Text(''),
                          ],
                        ),
                      ],
                    ),
                    Divider(height: 1.0),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: DashboardButton(
                      icon: Icons.create,
                      text: 'Kubernetes_create',
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Create_dash();
                        }));
                      },
                    ),
                  ),
                  Expanded(
                    child: DashboardButton(
                      icon: Icons.content_copy,
                      text: 'Kubernetes_exec',
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Exec();
                        }));
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: DashboardButton(
                      icon: Icons.get_app,
                      text: 'Kubernetes_get',
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Get();
                        }));
                      },
                    ),
                  ),
                  Expanded(
                    child: DashboardButton(
                      icon: Icons.network_wifi,
                      text: 'Kubernetes_expose',
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Expose();
                        }));
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: DashboardButton(
                      icon: Icons.pageview,
                      text: 'Kubernetes_describe',
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Describe();
                        }));
                      },
                    ),
                  ),
                  Expanded(
                    child: DashboardButton(
                      icon: Icons.folder,
                      text: 'Kubernetes_File',
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return File();
                        }));
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: DashboardButton(
                      icon: Icons.linear_scale,
                      text: 'Kubernetes_scale',
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Scale();
                        }));
                      },
                    ),
                  ),
                  Expanded(
                    child: DashboardButton(
                      icon: Icons.delete_sweep,
                      text: 'Kubernetes_remove',
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Delete();
                        }));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}

class DashboardButton extends StatelessWidget {
  const DashboardButton({
    Key key,
    @required this.icon,
    @required this.text,
    this.onTap,
  }) : super(key: key);

  final IconData icon;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            FractionallySizedBox(
              widthFactor: 0.4,
              child: FittedBox(
                child: Icon(icon),
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF00BFA5),
                fontSize: 20.0,
                backgroundColor: Colors.black,
              ),
              textScaleFactor: 0.8,
            ),
            SizedBox(height: 4.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Divider(height: 1.0),
            ),
          ],
        ),
      ),
    );
  }
}
