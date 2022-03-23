import "package:flutter/material.dart";
import "package:hconnect/screens/onboard/splashscreen.dart";

void main() async {
  runApp(myapp());
}

class myapp extends StatelessWidget {
  const myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: splash());
  }
}
