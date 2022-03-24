import "package:flutter/material.dart";
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hconnect/screens/onboard/homepage.dart';

class loginpage extends StatefulWidget {
  loginpage({Key? key}) : super(key: key);

  @override
  _loginpageState createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  TextEditingController enrollno = TextEditingController();
  TextEditingController password = TextEditingController();

  bool warden = true;
  bool student = false;
  List studentenroll = [];
  List studentpassword = [];
  bool showerror = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch_all_data();
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
              SizedBox(height: 10),
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
              SizedBox(height: 10),
              auth(
                  enrollno, context, warden ? "Warden Id" : "Enrollment no", 0),
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
            style: TextStyle(color: Colors.blue, fontSize: 60),
          ),
        ));
  }

  Widget auth(TextEditingController enrollcontroller, BuildContext context,
      String text, int k) {
    return Padding(
      padding: EdgeInsets.only(top: 15, left: 30, right: 30, bottom: 15),
      child: TextField(
        controller: enrollcontroller,
        obscureText: k == 1 ? true : false,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: text,
          hintText: text,
        ),
      ),
    );
  }

  Widget loginbutton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        for (int i = 0; i < studentenroll.length; i++) {
          if (enrollno.text == studentenroll[i]) {
            if (password.text == studentpassword[i]) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => home()),
              );
            } else {
              setState(() {
                showerror = true;
              });
            }
          }
        }
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
    try {
      CollectionReference data =
          await FirebaseFirestore.instance.collection('studentprofile');
      List<DocumentSnapshot> studentinfodocs = (await data.get()).docs;
      List<String> enrollno =
          studentinfodocs.map((e) => e['enrollno'] as String).toList();
      List<String> password =
          studentinfodocs.map((e) => e['password'] as String).toList();
      setState(() {
        studentenroll = enrollno;
        studentpassword = password;
      });
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
