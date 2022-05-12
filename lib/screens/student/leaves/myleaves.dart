import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hconnect/screens/student/leaves/myleavesdetails.dart';
import 'package:hconnect/screens/student/leaves/leaveform.dart';
import 'package:hconnect/screens/warden/leavemanagement/studentleavedetails.dart';

class myleaves extends StatefulWidget {
  String enrollno;
  myleaves(this.enrollno);

  @override
  _myleavesState createState() => _myleavesState();
}

class _myleavesState extends State<myleaves> {
  bool isloading = true;
  List startdate = [];
  List starttime = [];
  List endtime = [];
  List enddate = [];
  List reason = [];
  List address = [];

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
                    child: Text("All leaves",
                        style: TextStyle(color: Colors.white, fontSize: 30)),
                  ),
                  Createleaves(context)
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
                            itemCount: reason.length,
                            itemBuilder: (context, index) {
                              return Cont(
                                  startdate[index],
                                  enddate[index],
                                  reason[index],
                                  address[index],
                                  starttime[index],
                                  endtime[index]);
                            })),
              ),
            ],
          ),
        ));
  }

  Widget Cont(String text2, String text3, String text4, String text5,
      String text6, String text7) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    myleavedetails(text2, text3, text4, text5, text6, text7)));
      },
      child: Container(
          height: 80,
          margin: EdgeInsets.only(left: 15, right: 15, top: 12),
          decoration: BoxDecoration(
              color: Colors.grey[300], borderRadius: BorderRadius.circular(40)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                child: Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    text4,
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
                  text2 + " -- " + text3,
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
          await FirebaseFirestore.instance.collection('leaves');
      List<DocumentSnapshot> leavesdocs =
          (await data.where('enrollno', isEqualTo: widget.enrollno).get()).docs;
      List<String> d =
          leavesdocs.map((e) => e['departdate'] as String).toList();
      List<String> dt =
          leavesdocs.map((e) => e['departtime'] as String).toList();
      List<String> at =
          leavesdocs.map((e) => e['arrivaltime'] as String).toList();

      List<String> a =
          leavesdocs.map((e) => e['arrivaldate'] as String).toList();
      List<String> r = leavesdocs.map((e) => e['reason'] as String).toList();
      List<String> ad = leavesdocs.map((e) => e['address'] as String).toList();
      setState(() {
        startdate = d;
        enddate = a;
        reason = r;
        address = ad;
        starttime = dt;
        endtime = at;

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

  Widget Createleaves(BuildContext context) {
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
                    builder: (context) => LeaveForm(widget.enrollno)));
          },
        ),
      ),
    );
  }
}
