import "package:flutter/material.dart";
import 'package:hconnect/screens/student/complaint/complaintform.dart';
import 'package:hconnect/screens/warden/complaintmanagement/complaints.dart';
import "package:hconnect/screens/onboard/splashscreen.dart";
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hconnect/screens/warden/complaintmanagement/wardencomplaintdetails.dart';
import 'package:hconnect/screens/student/studenthomepage.dart';
import 'package:hconnect/screens/student/studentprofile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(myapp());
}

class myapp extends StatelessWidget {
  const myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: splash());
  }
}
