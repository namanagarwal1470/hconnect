import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hconnect/screens/warden/complaintmanagement/wardencomplaintdetails.dart';

class complaintpage extends StatefulWidget {
  complaintpage({Key? key}) : super(key: key);

  @override
  _complaintpageState createState() => _complaintpageState();
}

class _complaintpageState extends State<complaintpage> {
  List enrollno = [];
  List complaint = [];
  List roomno = [];
  List date = [];
  List status = [];
  List type = [];
  bool isloading = true;

  @override
  void initState() {
    super.initState();
    fetch_all_data();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                arrowbackbutton(context),
                Container(
                  height: (MediaQuery.of(context).size.height) * 0.1,
                  margin: EdgeInsets.only(left: 10, top: 50),
                  child: Text("All Complaints",
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
                                enrollno[index],
                                complaint[index],
                                type[index],
                                date[index],
                                roomno[index],
                                status[index]);
                          })),
            ),
          ],
        ));
  }

  Widget Cont(String text1, String text2, String text3, String text4,
      String text5, String text6) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => studentcomplaint(
                    text1, text2, text3, text4, text5, text6)));
      },
      child: Container(
          height: 80,
          margin: EdgeInsets.only(left: 15, right: 15, top: 12),
          decoration: BoxDecoration(
              color: text6 == "true" ? Colors.green[300] : Colors.red[300],
              borderRadius: BorderRadius.circular(30)),
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
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Text(
                  "Enrollno: " + text1,
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
          await FirebaseFirestore.instance.collection('complaints');
      List<DocumentSnapshot> complaintdocs = (await data.get()).docs;
      List<String> e =
          complaintdocs.map((e) => e['enrollno'] as String).toList();
      List<String> c =
          complaintdocs.map((e) => e['complaint'] as String).toList();
      List<String> t = complaintdocs.map((e) => e['type'] as String).toList();
      List<String> d = complaintdocs.map((e) => e['date'] as String).toList();
      List<String> r = complaintdocs.map((e) => e['roomno'] as String).toList();
      List<String> s = complaintdocs.map((e) => e['status'] as String).toList();
      setState(() {
        enrollno = e;
        complaint = c;
        roomno = r;
        date = d;
        type = t;
        status = s;
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
          color: Colors.red,
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