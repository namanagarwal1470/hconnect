import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hconnect/screens/warden/leavemanagement/studentleavedetails.dart';
import 'package:hconnect/screens/warden/roommanagement/roomdetails.dart';

class rooms extends StatefulWidget {
  rooms({Key? key}) : super(key: key);

  @override
  _roomsState createState() => _roomsState();
}

class _roomsState extends State<rooms> {
  bool isloading = true;
  List roomno = [];
  List name = [];

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
                  child: Text("All Rooms",
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
                          itemCount: roomno.length,
                          itemBuilder: (context, index) {
                            return Cont(roomno[index], name[index]);
                          })),
            ),
          ],
        ));
  }

  Widget Cont(
    String text1,
    String text2,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => roomdetails(text1, text2)));
      },
      child: Container(
          height: 60,
          margin: EdgeInsets.only(left: 15, right: 15, top: 12),
          decoration: BoxDecoration(
              color: Colors.grey[300], borderRadius: BorderRadius.circular(40)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Text(
                  text1,
                  style: TextStyle(color: Colors.black, fontSize: 18),
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
      List<DocumentSnapshot> leavesdocs =
          (await data.where('type', isEqualTo: "student").get()).docs;
      List<String> r =
          leavesdocs.map((e) => e['roomno'] as String).toSet().toList();

      List<String> n = leavesdocs.map((e) => e['name'] as String).toList();
      setState(() {
        roomno = r;
        name = n;
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