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
                          EdgeInsets.only(left: 20, right: 20, top: 20),
                      title: Text(
                        'Welcome Back!',
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        LeaveForm(widget.enrollno)))
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  //background color of box
                                  BoxShadow(
                                    color: Color.fromARGB(255, 128, 89, 196),
                                    // soften the shadow
                                    //extend the shadow
                                    spreadRadius: 1.0,
                                    blurRadius: 5.0,
                                    offset: Offset(
                                      3.0, // Move to right 10  horizontally
                                      3.0, // Move to bottom 10 Vertically
                                    ),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(25)),
                            height: 200,
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Apply for",
                                  style: TextStyle(fontSize: 22),
                                ),
                                Text(
                                  "leave",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ComplainForm(widget.enrollno)))
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  //background color of box
                                  BoxShadow(
                                    color: Color.fromARGB(255, 128, 89, 196),
                                    // soften the shadow
                                    //extend the shadow
                                    spreadRadius: 1.0,
                                    blurRadius: 5.0,
                                    offset: Offset(
                                      3.0, // Move to right 10  horizontally
                                      3.0, // Move to bottom 10 Vertically
                                    ),
                                  )
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25)),
                            height: 200,
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Register",
                                  style: TextStyle(fontSize: 22),
                                ),
                                Text(
                                  "Complaint",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ],
                            ),
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
                                    builder: (context) => wardenui()))
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  //background color of box
                                  BoxShadow(
                                    color: Color.fromARGB(255, 128, 89, 196),
                                    // soften the shadow
                                    //extend the shadow
                                    spreadRadius: 1.0,
                                    blurRadius: 5.0,
                                    offset: Offset(
                                      3.0, // Move to right 10  horizontally
                                      3.0, // Move to bottom 10 Vertically
                                    ),
                                  )
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25)),
                            height: 200,
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Warden",
                                  style: TextStyle(fontSize: 22),
                                ),
                                Text(
                                  "Details",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        myfine(widget.enrollno)))
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  //background color of box
                                  BoxShadow(
                                    color: Color.fromARGB(255, 128, 89, 196),
                                    // soften the shadow
                                    //extend the shadow
                                    spreadRadius: 1.0,
                                    blurRadius: 5.0,
                                    offset: Offset(
                                      3.0, // Move to right 10  horizontally
                                      3.0, // Move to bottom 10 Vertically
                                    ),
                                  )
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25)),
                            height: 200,
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Pay",
                                  style: TextStyle(fontSize: 22),
                                ),
                                Text(
                                  "Fines",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 50)
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
                      icon: Icon(FontAwesomeIcons.arrowRightFromBracket),
                      color: Colors.deepPurple,
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
                      icon: Icon(FontAwesomeIcons.fileInvoice),
                      color: Colors.deepPurple,
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
                      icon: Icon(FontAwesomeIcons.moneyBillTransfer),
                      color: Colors.deepPurple,
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
              icon: Icon(FontAwesomeIcons.user),
              iconSize: 20,
              color: Colors.deepPurple,
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
