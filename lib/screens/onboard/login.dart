import "package:flutter/material.dart";
import 'package:cloud_firestore/cloud_firestore.dart';

class loginpage extends StatefulWidget {
  loginpage({Key? key}) : super(key: key);

  @override
  _loginpageState createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  TextEditingController enrollno = TextEditingController();
  TextEditingController password = TextEditingController();
  List topicsnames = [];

  bool warden = true;
  bool student = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch_topics();
  }

  fetch_topics() async {
    List<String> all_topics = await fetch_all_topics();
    setState(() {
      topicsnames = all_topics;
      print(all_topics);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Container(
          height: (MediaQuery.of(context).size.height) * 0.65,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.blue[700],
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(50))),
          child: ListView(
            children: [
              SizedBox(height: 100),
              headline(),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: this.warden,
                    onChanged: (warden) {
                      setState(() {
                        if (this.student == true) {
                          this.warden = warden!;
                          this.student = false;
                        }
                      });
                    },
                  ),
                  Text(
                    "Warden/Admin login",
                    style: TextStyle(color: Colors.black, fontSize: 23),
                  )
                ],
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: this.student,
                    onChanged: (student) {
                      setState(() {
                        if (this.warden == true) {
                          this.student = student!;
                          this.warden = false;
                        }
                      });
                    },
                  ),
                  Text(
                    "Student login",
                    style: TextStyle(color: Colors.black, fontSize: 23),
                  )
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  auth(enrollno, context,
                      warden ? "Warden Id" : "Enrollment no"),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  auth(password, context, "Password"),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  loginbutton(context),
                ],
              ),
              forgotpassword(),
            ],
          ),
        ),
      ],
    ));
  }

  Widget headline() {
    return Container(
        margin: EdgeInsets.all(20),
        child: Center(
          child: Text(
            "H-Connect",
            style: TextStyle(color: Colors.white, fontSize: 60),
          ),
        ));
  }

  Widget auth(TextEditingController enrollcontroller, BuildContext context,
      String text) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      width: MediaQuery.of(context).size.width * 0.8,
      height: 40,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 15),
          Container(
              width: (MediaQuery.of(context).size.width) * 0.6,
              height: 35,
              child: Center(
                child: TextField(
                  style: TextStyle(fontSize: 20),
                  controller: enrollcontroller,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: text,
                    border: InputBorder.none,
                  ),
                ),
              ))
        ],
      ),
    );
  }

  Widget loginbutton(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        child: Center(
          child: Text(
            "Login",
            style: TextStyle(color: Colors.blue, fontSize: 20),
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        width: MediaQuery.of(context).size.width * 0.3,
        height: 40,
      ),
    );
  }

  Widget forgotpassword() {
    return Container(
        margin: EdgeInsets.all(20),
        child: Center(
          child: Text(
            "Forget Password?",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ));
  }

  Future<List<String>> fetch_all_topics() async {
    try {
      CollectionReference topicsdata =
          await FirebaseFirestore.instance.collection('studentprofile');
      List<DocumentSnapshot> topicinfodocs = (await topicsdata.get()).docs;
      List<String> topics =
          topicinfodocs.map((e) => e['enrollno'] as String).toList();
      return topics;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
