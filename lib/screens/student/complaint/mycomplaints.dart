import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hconnect/screens/student/complaint/mycomplaintdetails.dart';
import 'package:hconnect/screens/student/complaint/complaintform.dart';
import 'package:hconnect/screens/warden/complaintmanagement/complaints.dart';
import 'package:hconnect/screens/warden/complaintmanagement/wardencomplaintdetails.dart';

class mycomplaints extends StatefulWidget {
  String enrollno;
  mycomplaints(this.enrollno);

  @override
  _mycomplaintsState createState() => _mycomplaintsState();
}

class _mycomplaintsState extends State<mycomplaints> {
  List complaint = [];
  List date = [];
  List status = [];
  List type = [];
  List docid = [];
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
        body: RefreshIndicator(
          onRefresh: () {
            return Future.delayed(
              Duration(seconds: 1),
              () {
                setState(() {
                  fetch_all_data();
                });
              },
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  arrowbackbutton(context),
                  Container(
                    height: (MediaQuery.of(context).size.height) * 0.1,
                    width: MediaQuery.of(context).size.width * 0.6,
                    margin: EdgeInsets.only(left: 10, top: 50),
                    child: Text("My Complaints",
                        style: TextStyle(color: Colors.white, fontSize: 30)),
                  ),
                  Createcomplaint(context)
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
                            itemCount: complaint.length,
                            itemBuilder: (context, index) {
                              return Cont(complaint[index], type[index],
                                  date[index], status[index], docid[index]);
                            })),
              ),
            ],
          ),
        ));
  }

  Widget Cont(
      String text2, String text3, String text4, String text6, String text1) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    mycomplaintdetails(text2, text3, text4, text6, text1)));
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
                    text3,
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
                  "Date: " + text4,
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
      List<DocumentSnapshot> complaintdocs =
          (await data.where('enrollno', isEqualTo: widget.enrollno).get()).docs;
      List<String> c =
          complaintdocs.map((e) => e['complaint'] as String).toList();
      List<String> t = complaintdocs.map((e) => e['type'] as String).toList();
      List<String> d = complaintdocs.map((e) => e['date'] as String).toList();
      List<String> l = complaintdocs.map((e) => e.id as String).toList();
      List<String> s = complaintdocs.map((e) => e['status'] as String).toList();
      setState(() {
        complaint = c;
        docid = l;
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

  Widget Createcomplaint(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      margin: EdgeInsets.only(top: 20),
      child: Ink(
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: CircleBorder(),
        ),
        child: IconButton(
          icon: Icon(Icons.add),
          color: Colors.deepPurple,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ComplainForm(widget.enrollno)));
          },
        ),
      ),
    );
  }
}
