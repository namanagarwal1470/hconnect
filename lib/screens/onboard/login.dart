import "package:flutter/material.dart";
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hconnect/screens/studenthomepage.dart';
import 'package:hconnect/screens/wardenhomepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class loginpage extends StatefulWidget {
  loginpage({Key? key}) : super(key: key);

  @override
  _loginpageState createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  TextEditingController enrollno = TextEditingController();
  TextEditingController password = TextEditingController();

  List id = [];
  List idpassword = [];
  List usertype = [];
  bool showerror = false;
  Map<String, String> k = {};

  @override
  void initState() {
    // TODO: implement initState
    fetch_all_data();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Container(
          height: (MediaQuery.of(context).size.height),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: ListView(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              headline(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              auth(enrollno, context, "Id", 0),
              auth(password, context, "Password", 1),
              SizedBox(height: 10),
              showerror
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Wrong password entered",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 15,
                            )),
                      ],
                    )
                  : Text(""),
              SizedBox(height: 10),
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
            style: TextStyle(color: Colors.blue, fontSize: 50),
          ),
        ));
  }

  Widget auth(TextEditingController enrollcontroller, BuildContext context,
      String text, int k) {
    return Padding(
      padding: EdgeInsets.only(top: 15, left: 30, right: 30, bottom: 15),
      child: TextField(
        controller: enrollcontroller,
        style: TextStyle(fontSize: 20),
        decoration: new InputDecoration(
            border: new OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(30.0),
              ),
            ),
            filled: true,
            hintStyle: new TextStyle(color: Colors.grey[700]),
            labelText: text,
            hintText: text,
            fillColor: Colors.white70),
        obscureText: k == 1 ? true : false,
      ),
    );
  }

  Widget loginbutton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        routenavigator();
      },
      child: Container(
        child: Center(
          child: Text(
            "Login",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.blue),
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
            style: TextStyle(color: Colors.blue, fontSize: 20),
          ),
        ));
  }

  fetch_all_data() async {
    Map<String, String> r = {};
    try {
      CollectionReference data =
          await FirebaseFirestore.instance.collection('studentprofile');
      List<DocumentSnapshot> studentinfodocs = (await data.get()).docs;
      print(studentinfodocs);
      List<String> enrollno =
          studentinfodocs.map((e) => e['enrollno'] as String).toList();
      List<String> password =
          studentinfodocs.map((e) => e['password'] as String).toList();
      List<String> type =
          studentinfodocs.map((e) => e['type'] as String).toList();
      for (int i = 0; i < enrollno.length; i++) {
        r[enrollno[i]] = password[i];
      }
      setState(() {
        id = enrollno;
        idpassword = password;
        usertype = type;
        k = r;
        print(k);
      });
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  routenavigator() {
    for (int i = 0; i < id.length; i++) {
      if (enrollno.text == id[i]) {
        if (password.text == idpassword[i]) {
          if (usertype[i] == "admin") {
            add_user(enrollno.text, usertype[i]);

            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) => wardenhomepage(enrollno.text)),
                (Route<dynamic> route) => false);
          } else {
            add_user(enrollno.text, usertype[i]);

            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) => studenthomepage(enrollno.text)),
                (Route<dynamic> route) => false);
          }
        } else {
          setState(() {
            showerror = true;
          });
        }
      }
    }
  }

  void add_user(String en, String typeof) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('enroll', en);
      await prefs.setString('type', typeof);
    } catch (e) {
      print("Error while adding user data check preferences");
    }
  }
}
