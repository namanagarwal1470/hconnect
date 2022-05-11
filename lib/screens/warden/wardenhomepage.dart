import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hconnect/screens/warden/complaintmanagement/complaints.dart';
import 'package:hconnect/screens/warden/finemanagement/createfine.dart';
import 'package:hconnect/screens/warden/finemanagement/finemanagement.dart';
import 'package:hconnect/screens/warden/leavemanagement/leaves.dart';
import 'package:hconnect/screens/onboard/login.dart';
import 'package:hconnect/screens/warden/roommanagement/rooms.dart';
import 'package:hconnect/screens/warden/students/students.dart';
import 'package:hconnect/screens/warden/wardenprofile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class wardenhomepage extends StatefulWidget {
  String enrollno;
  String name;

  wardenhomepage(this.enrollno, this.name);

  @override
  State<wardenhomepage> createState() => _wardenhomepageState();
}

class _wardenhomepageState extends State<wardenhomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(child: draweritems(context)),
      appBar: AppBar(
        title: appbardata(context),
        elevation: 0,
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView(
        children: [
          Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: Container(color: Colors.deepPurple)),
                ],
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      contentPadding:
                          EdgeInsets.only(left: 20, right: 20, top: 15),
                      title: Text(
                        'Welcome Back!',
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => leavepage()))
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(25)),
                            height: 200,
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: Center(child: Text("All leaves")),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => complaintpage()))
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(25)),
                            height: 200,
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: Center(child: Text("All Complaints")),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => rooms()))
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(25)),
                            height: 200,
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: Center(child: Text("Room Details")),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => finemanagementpage()))
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(25)),
                            height: 200,
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: Center(child: Text("Fine Management")),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => studentpage()))
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(25)),
                            height: 200,
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Center(child: Text("All Student Details")),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
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
          decoration: BoxDecoration(color: Colors.deepPurple),
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
                    builder: (context) => wardenprofile(widget.enrollno)));
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
                      color: Colors.deepPurple,
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
                      color: Colors.deepPurple,
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
              icon: Icon(Icons.verified_sharp),
              iconSize: 15,
              color: Colors.deepPurple,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => wardenprofile(widget.enrollno)));
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
