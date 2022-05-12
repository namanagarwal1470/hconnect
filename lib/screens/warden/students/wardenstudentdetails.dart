import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class wardenstudentdetails extends StatefulWidget {
  String enrollno;

  wardenstudentdetails(
    this.enrollno,
  );

  @override
  State<wardenstudentdetails> createState() => _wardenstudentdetailsState();
}

class _wardenstudentdetailsState extends State<wardenstudentdetails> {
  String name = '';
  String dob = '';
  String branch = '';
  String year = '';
  String email = '';
  String mobileno = '';
  String bloodgroup = '';
  String hostelname = '';
  String roomno = '';
  String parentsname = '';
  String parentsmobile = '';
  String localguardianname = '';
  String localguardianmobile = '';
  String address = '';
  String floor = '';
  bool isloading = true;

  @override
  void initState() {
    super.initState();
    fetch_all_data();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(name),
          backgroundColor: Colors.deepPurple,
          leading: GestureDetector(
              onTap: () => {
                    Navigator.pop(context),
                  },
              child: Icon(Icons.arrow_back))),
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
        child: ListView(children: [
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
                        "Name",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        name,
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
                        "Enrollno",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.enrollno,
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
                        "DOB",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        dob,
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
                        "Branch & year",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        branch + '-' + year,
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
                        "Email",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        email,
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
                        "Mobilno",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        mobileno,
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
                        "Blood Group",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        bloodgroup,
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
                        "Hostel name & roomno",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        hostelname + "-" + roomno,
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
                        "parentsname & mobileno",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        parentsname + "-" + parentsmobile,
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
                        "local guardian name & mobileno",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        localguardianname + "-" + localguardianmobile,
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
                        "address",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        address,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  )),
            ],
          )
        ]),
      ),
    );
  }

  fetch_all_data() async {
    try {
      CollectionReference data =
          await FirebaseFirestore.instance.collection('Userprofile');
      List<DocumentSnapshot> leavesdocs =
          (await data.where('enrollno', isEqualTo: widget.enrollno).get()).docs;
      List<String> ad = leavesdocs.map((e) => e['address'] as String).toList();

      List<String> bg =
          leavesdocs.map((e) => e['bloodgroup'] as String).toList();
      List<String> br = leavesdocs.map((e) => e['branch'] as String).toList();
      List<String> db = leavesdocs.map((e) => e['dob'] as String).toList();
      List<String> em = leavesdocs.map((e) => e['email'] as String).toList();
      List<String> fl = leavesdocs.map((e) => e['floor'] as String).toList();
      List<String> h = leavesdocs.map((e) => e['hostel'] as String).toList();
      List<String> nm = leavesdocs.map((e) => e['name'] as String).toList();
      List<String> lgn =
          leavesdocs.map((e) => e['local guardian name'] as String).toList();
      List<String> lgp =
          leavesdocs.map((e) => e['local guardian phoneno'] as String).toList();
      List<String> pn =
          leavesdocs.map((e) => e['parent name'] as String).toList();
      List<String> pp =
          leavesdocs.map((e) => e['parent phoneno'] as String).toList();
      List<String> pno = leavesdocs.map((e) => e['phoneno'] as String).toList();
      List<String> rn = leavesdocs.map((e) => e['roomno'] as String).toList();
      List<String> y = leavesdocs.map((e) => e['year'] as String).toList();
      setState(() {
        name = nm[0];
        dob = db[0];
        branch = br[0];
        year = y[0];
        email = em[0];
        mobileno = pno[0];
        bloodgroup = bg[0];
        hostelname = h[0];
        roomno = rn[0];
        floor = fl[0];
        parentsname = pn[0];
        parentsmobile = pp[0];
        localguardianname = lgn[0];
        localguardianmobile = lgp[0];
        address = ad[0];
        isloading = false;
      });
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
