import 'package:flutter/material.dart';

class complaintpage extends StatefulWidget {
  complaintpage({Key? key}) : super(key: key);

  @override
  _complaintpageState createState() => _complaintpageState();
}

class _complaintpageState extends State<complaintpage> {
  List topicsnames = ["hello", "world"];
  bool isloading = true;

  @override
  void initState() {
    super.initState();
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
                  child: ListView.builder(
                      itemCount: topicsnames.length,
                      itemBuilder: (context, index) {
                        return Cont(topicsnames[index]);
                      })),
            ),
          ],
        ));
  }

  Widget Cont(String text1) {
    return GestureDetector(
      onTap: () {},
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
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
            ],
          )),
    );
  }
}
