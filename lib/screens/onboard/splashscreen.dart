import "package:flutter/material.dart";
import 'dart:async';
import 'package:hconnect/screens/onboard/login.dart';

class splash extends StatefulWidget {
  splash({Key? key}) : super(key: key);

  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = new Duration(seconds: 2);
    return Timer(duration, isuserroute);
  }

  isuserroute() async {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => loginpage()),
        (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Row(
              children: [
                Container(
                  height: (MediaQuery.of(context).size.height) * 0.3,
                  width: (MediaQuery.of(context).size.width) * 0.5,
                  decoration: BoxDecoration(
                      color: Colors.blue[800],
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(400))),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                    height: (MediaQuery.of(context).size.height) * 0.4,
                    width: (MediaQuery.of(context).size.width),
                    child: Center(
                      child: Text(
                        "H-connect",
                        style: TextStyle(color: Colors.blue, fontSize: 70),
                      ),
                    ),
                    color: Colors.white)
              ],
            ),
            Row(
              children: [
                SizedBox(width: (MediaQuery.of(context).size.width) * 0.5),
                Container(
                  height: (MediaQuery.of(context).size.height) * 0.3,
                  width: (MediaQuery.of(context).size.width) * 0.5,
                  decoration: BoxDecoration(
                      color: Colors.blue[800],
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(400))),
                )
              ],
            )
          ],
        ));
  }
}
