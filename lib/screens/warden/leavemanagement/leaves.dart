import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hconnect/screens/warden/leavemanagement/studentleavedetails.dart';

class leavepage extends StatefulWidget {
  leavepage({Key? key}) : super(key: key);

  @override
  _leavepageState createState() => _leavepageState();
}

class _leavepageState extends State<leavepage> {
  bool isloading = true;
  List enrollno = [];
  List startdate = [];
  List enddate = [];

  List starttime = [];
  List endtime = [];
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
                children: [
                  arrowbackbutton(context),
                  Container(
                    height: (MediaQuery.of(context).size.height) * 0.1,
                    margin: EdgeInsets.only(left: 10, top: 50),
                    child: Text("All leaves",
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

  Widget Cont(String text1, String text2, String text3, String text4,
      String text5, String text6, String text7) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => studentleave(
                    text1, text2, text3, text4, text5, text6, text7)));
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
                    text1,
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
      List<DocumentSnapshot> leavesdocs = (await data.get()).docs;
      List<String> e = leavesdocs.map((e) => e['enrollno'] as String).toList();
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
        enrollno = e;
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
}
