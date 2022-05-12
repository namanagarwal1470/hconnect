import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hconnect/screens/warden/students/wardenstudentdetails.dart';

class studentpage extends StatefulWidget {
  studentpage({Key? key}) : super(key: key);

  @override
  _studentpageState createState() => _studentpageState();
}

class _studentpageState extends State<studentpage> {
  List enrollno = [];
  List roomno = [];
  List names = [];
  bool isloading = true;

  @override
  void initState() {
    super.initState();
    fetch_all_data();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                arrowbackbutton(context),
                Container(
                  height: (MediaQuery.of(context).size.height) * 0.1,
                  margin: EdgeInsets.only(left: 10, top: 50),
                  child: Text("All Students",
                      style: TextStyle(color: Colors.white, fontSize: 30)),
                ),
              ],
            ),
            Expanded(
              flex: 1,
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  child: isloading
                      ? Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          itemCount: enrollno.length,
                          itemBuilder: (context, index) {
                            return Cont(
                                enrollno[index], names[index], roomno[index]);
                          })),
            ),
          ],
        ));
  }

  Widget Cont(String text1, String text2, String text3) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => wardenstudentdetails(text1)));
      },
      child: Container(
          height: 80,
          margin: EdgeInsets.only(left: 15, right: 15, top: 10),
          decoration: BoxDecoration(
              color: Colors.grey[300], borderRadius: BorderRadius.circular(30)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                child: Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    text2,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Text(
                  text1 + "   (" + text3 + ")",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
            ],
          )),
    );
  }

  fetch_all_data() async {
    try {
      CollectionReference data =
          await FirebaseFirestore.instance.collection('Userprofile');
      List<DocumentSnapshot> studentdocs =
          (await data.where("type", isEqualTo: "student").get()).docs;
      List<String> e = studentdocs.map((e) => e['enrollno'] as String).toList();
      List<String> r = studentdocs.map((e) => e['roomno'] as String).toList();
      List<String> n = studentdocs.map((e) => e['name'] as String).toList();

      setState(() {
        enrollno = e;
        roomno = r;
        names = n;

        isloading = false;
      });
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Widget arrowbackbutton(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Ink(
        decoration: ShapeDecoration(
          color: Colors.deepPurple,
          shape: CircleBorder(),
        ),
        child: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
