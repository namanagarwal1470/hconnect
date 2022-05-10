import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hconnect/screens/student/complaint/complaintform.dart';
import 'package:hconnect/screens/student/complaint/mycomplaints.dart';
import 'package:hconnect/screens/student/fine/myfines.dart';
import 'package:hconnect/screens/student/leaves/leaveform.dart';
import 'package:hconnect/screens/onboard/login.dart';
import 'package:hconnect/screens/student/leaves/myleaves.dart';
import 'package:hconnect/screens/student/studentprofile.dart';
import 'package:hconnect/screens/student/wardenui/wardenui.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class studenthomepage extends StatefulWidget {
  String enrollno;
  String name = '';

  studenthomepage(this.enrollno, this.name);

  @override
  State<studenthomepage> createState() => _studenthomepageState();
}

class _studenthomepageState extends State<studenthomepage> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(child: draweritems(context)),
      appBar: AppBar(
        elevation: 0,
        title: appbardata(context),
        backgroundColor: Colors.red,
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LeaveForm(widget.enrollno)))
                },
                child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20)),
                    margin: EdgeInsets.all(10),
                    width: double.infinity,
                    child: Center(child: Text("Apply for leave"))),
              ),
              GestureDetector(
                onTap: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ComplainForm(widget.enrollno)))
                },
                child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20)),
                    margin: EdgeInsets.all(10),
                    width: double.infinity,
                    child: Center(child: Text("Register Complaint"))),
              ),
              GestureDetector(
                onTap: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => wardenui()))
                },
                child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20)),
                    margin: EdgeInsets.all(10),
                    width: double.infinity,
                    child: Center(child: Text("Warden Details"))),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget draweritems(BuildContext context) {
    return ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(color: Colors.red),
          child: Center(
              child: Text(
            'H-connect',
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          )),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => studentprofile(widget.enrollno)));
          },
          child: ListTile(
            title: Row(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: Center(
                    child: IconButton(
                      padding: EdgeInsets.all(5),
                      icon: Icon(FontAwesomeIcons.user),
                      color: Colors.red,
                      onPressed: () {},
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  'Profile',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => myleaves(widget.enrollno)));
          },
          child: ListTile(
            title: Row(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: Center(
                    child: IconButton(
                      padding: EdgeInsets.all(5),
                      icon: Icon(FontAwesomeIcons.user),
                      color: Colors.red,
                      onPressed: () {},
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  'My leaves',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => mycomplaints(widget.enrollno)));
          },
          child: ListTile(
            title: Row(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: Center(
                    child: IconButton(
                      padding: EdgeInsets.all(5),
                      icon: Icon(FontAwesomeIcons.user),
                      color: Colors.red,
                      onPressed: () {},
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  'My Complaints',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => myfine(widget.enrollno)));
          },
          child: ListTile(
            title: Row(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: Center(
                    child: IconButton(
                      padding: EdgeInsets.all(5),
                      icon: Icon(FontAwesomeIcons.user),
                      color: Colors.red,
                      onPressed: () {},
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  'My Fines',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            removeuser(context);
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => loginpage()),
                (Route<dynamic> route) => false);
          },
          child: ListTile(
            title: Row(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: Center(
                    child: IconButton(
                      padding: EdgeInsets.all(5),
                      icon: Icon(FontAwesomeIcons.usersSlash),
                      color: Colors.red,
                      onPressed: () {},
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  'Log out',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget appbardata(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Hi, " + widget.name,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20)),
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.white),
          child: Center(
            child: IconButton(
              padding: EdgeInsets.all(5),
              icon: Icon(Icons.person),
              iconSize: 30,
              color: Colors.red,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => studentprofile(widget.enrollno)));
              },
            ),
          ),
        ),
      ],
    );
  }

  void removeuser(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("enroll");
    prefs.remove("type");
    prefs.remove("name");
  }
}
