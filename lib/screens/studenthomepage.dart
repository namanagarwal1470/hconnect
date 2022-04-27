import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class studenthomepage extends StatefulWidget {
  studenthomepage({Key? key}) : super(key: key);

  @override
  State<studenthomepage> createState() => _studenthomepageState();
}

class _studenthomepageState extends State<studenthomepage> {
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
                child: Container(
                    height: 150,
                    margin: EdgeInsets.all(20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(child: Text("Student profile"))),
              ),
              GestureDetector(
                child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20)),
                    margin: EdgeInsets.all(20),
                    width: double.infinity,
                    child: Center(child: Text("Complaint Register"))),
              ),
              GestureDetector(
                child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20)),
                    margin: EdgeInsets.all(20),
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
          onTap: () {},
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
          onTap: () {},
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
        Text("Hi, student",
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
              color: Colors.red,
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }
}
