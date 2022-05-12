import 'package:flutter/material.dart';

class studentcomplaint extends StatefulWidget {
  String enrollno;
  String date;
  String type;
  String roomno;
  String complaint;
  String status;
  studentcomplaint(this.enrollno, this.complaint, this.type, this.date,
      this.roomno, this.status);

  @override
  State<studentcomplaint> createState() => _studentcomplaintState();
}

class _studentcomplaintState extends State<studentcomplaint> {
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
      body: ListView(children: [
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
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.roomno,
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                )),
            Container(
                margin: EdgeInsets.only(left: 15, top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Complaint Type",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.type,
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                )),
            Container(
                margin: EdgeInsets.only(left: 15, top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Reason",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.complaint,
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                )),
            Container(
                margin: EdgeInsets.only(left: 15, top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Date of Complaint",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.date,
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                )),
            Container(
                margin: EdgeInsets.only(left: 15, top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Status",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.status == "true" ? "Resolved" : "unresolved",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                )),
          ],
        )
      ]),
    );
  }
}
