import 'package:flutter/material.dart';

class studentprofile extends StatefulWidget {
  studentprofile({Key? key}) : super(key: key);

  @override
  State<studentprofile> createState() => _studentprofileState();
}

class _studentprofileState extends State<studentprofile> {
  @override
  Widget build(BuildContext context) {
    double w_factor = MediaQuery.of(context).size.width / 360;
    double h_factor = MediaQuery.of(context).size.height / 800;
    return Scaffold(
      body: ListView(children: [
        Column(
          children: [
            Container(
              child: Container(
                  margin: EdgeInsets.all(10),
                  child: Center(
                    child: Text(
                      "Profile",
                      style: TextStyle(color: Colors.white, fontSize: 35),
                    ),
                  )),
              height: 150,
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 20, right: 15, left: 15),
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(50))),
            ),
            textcontainer(
                h_factor * 23, w_factor * 312, h_factor * 16, "Name:"),
            textfield(h_factor * 50, w_factor * 312, true, "Naman agarwal"),
            textcontainer(
                h_factor * 23, w_factor * 312, h_factor * 16, "Enrollno:"),
            textfield(h_factor * 50, w_factor * 312, true, "19103047"),
            textcontainer(h_factor * 23, w_factor * 312, h_factor * 16, "DOB:"),
            textfield(h_factor * 50, w_factor * 312, true, "14-07-2001"),
            textcontainer(h_factor * 23, w_factor * 312, h_factor * 16,
                "Branch & Year :"),
            textfield(h_factor * 50, w_factor * 312, true, "CSE"),
            textcontainer(
                h_factor * 23, w_factor * 312, h_factor * 16, "Email :"),
            textfield(h_factor * 50, w_factor * 312, true,
                "namanagarwal14072000@gmail.com"),
            textcontainer(
                h_factor * 23, w_factor * 312, h_factor * 16, "Mobileno:"),
            textfield(h_factor * 50, w_factor * 312, true, "9559302642"),
            textcontainer(
                h_factor * 23, w_factor * 312, h_factor * 16, "Blood group:"),
            textfield(h_factor * 50, w_factor * 312, true, "AB+"),
            textcontainer(h_factor * 23, w_factor * 312, h_factor * 16,
                "Hostel name & Room no :"),
            textfield(h_factor * 50, w_factor * 312, true, "ABB3-947"),
            textcontainer(h_factor * 23, w_factor * 312, h_factor * 16,
                "Parents name & Mobileno:"),
            textfield(h_factor * 50, w_factor * 312, true, "xyz-9559302642"),
            textcontainer(h_factor * 23, w_factor * 312, h_factor * 16,
                "Local Guardian name & Mobileno:"),
            textfield(h_factor * 50, w_factor * 312, true, "xyz-9559302642"),
            textcontainer(
                h_factor * 23, w_factor * 312, h_factor * 16, "Address:"),
            textfield(h_factor * 50, w_factor * 312, true, "hello"),
          ],
        )
      ]),
    );
  }

  Widget textcontainer(h, w, margintop, content) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: margintop),
          height: h,
          width: w,
          child: Text(
            content,
            style: TextStyle(fontSize: 15),
          ),
        )
      ],
    );
  }

  Widget textfield(h, w, isshow, content) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            height: h,
            width: w,
            child: isshow
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          margin: EdgeInsets.only(),
                          child: Text(
                            content,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  )
                : Text(""))
      ],
    );
  }
}
