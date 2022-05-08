import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class complaintpage extends StatefulWidget {
  complaintpage({Key? key}) : super(key: key);

  @override
  _complaintpageState createState() => _complaintpageState();
}

class _complaintpageState extends State<complaintpage> {
  List enrollno = [];
  List complaint = [];
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
            Container(
              height: (MediaQuery.of(context).size.height) * 0.1,
              margin: EdgeInsets.only(left: 40, top: 50),
              child: Text("All Complaints",
                  style: TextStyle(color: Colors.white, fontSize: 30)),
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
                                enrollno[index], complaint[index], type[index]);
                          })),
            ),
          ],
        ));
  }

  Widget Cont(String text1, String text2, String text3) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          height: 80,
          margin: EdgeInsets.only(left: 15, right: 15, top: 12),
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
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Text(
                  "Roomno: " + text1,
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
      setState(() {
        enrollno = e;
        complaint = c;
        type = t;
        isloading = false;
      });
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
