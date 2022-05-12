import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class roomdetails extends StatefulWidget {
  String roomno;
  String name;
  roomdetails(this.roomno, this.name);

  @override
  State<roomdetails> createState() => _roomdetailsState();
}

class _roomdetailsState extends State<roomdetails> {
  List names = ["", ""];
  bool isloading = true;

  @override
  void initState() {
    fetch_all_data();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          leading: GestureDetector(
              onTap: () => {
                    Navigator.pop(context),
                  },
              child: Icon(Icons.arrow_back))),
      body: isloading
          ? Center(child: CircularProgressIndicator())
          : ListView(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 15, top: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Room no",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            widget.roomno,
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      )),
                  Container(
                      margin: EdgeInsets.only(left: 15, top: 20),
                      child: names[0] == ""
                          ? Text("")
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Student1",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  names[0],
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            )),
                  Container(
                      margin: EdgeInsets.only(left: 15, top: 20),
                      child: names[1] == ""
                          ? Text("")
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Student2",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  names[1],
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            )),
                ],
              )
            ]),
    );
  }

  fetch_all_data() async {
    try {
      CollectionReference data =
          await FirebaseFirestore.instance.collection('Userprofile');
      List<DocumentSnapshot> leavesdocs =
          (await data.where('roomno', isEqualTo: widget.roomno).get()).docs;

      List<String> n = leavesdocs.map((e) => e['name'] as String).toList();
      if (n.length == 1) {
        n = [n[0], ""];
      } else if (n.length == null) {
        n = ["", ""];
      }

      setState(() {
        names = n;

        isloading = false;
      });
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
