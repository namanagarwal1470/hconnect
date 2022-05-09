import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LeaveForm extends StatefulWidget {
  String enrollno;
  LeaveForm(this.enrollno);
  @override
  _LeaveFormState createState() => _LeaveFormState();
}

class _LeaveFormState extends State<LeaveForm> {
  TextEditingController departdate = TextEditingController();
  TextEditingController arrivaldate = TextEditingController();
  TextEditingController departtime = TextEditingController();
  TextEditingController arrivaltime = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController reason = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: new EdgeInsets.all(15.0),
          child: formUI(),
        ),
      ),
    );
  }

  Widget formUI() {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Container(
              margin: EdgeInsets.all(10),
              child: Center(
                child: Text(
                  "Apply For Leave",
                  style: TextStyle(color: Colors.white, fontSize: 35),
                ),
              )),
          height: 150,
          width: double.infinity,
          margin: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(50))),
        ),
        TextField(
          decoration: InputDecoration(
            border: new OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15.0),
              ),
            ),
            filled: true,
            icon: const Icon(Icons.calendar_today),
            hintText: 'Enter the date',
            labelText: 'Date of Departure',
          ),
          keyboardType: TextInputType.datetime,
          controller: departdate,
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            border: new OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15.0),
              ),
            ),
            filled: true,
            icon: const Icon(Icons.calendar_today),
            hintText: 'Enter the date',
            labelText: 'Date of Arrival',
          ),
          keyboardType: TextInputType.datetime,
          controller: arrivaldate,
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            border: new OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15.0),
              ),
            ),
            filled: true,
            icon: const Icon(Icons.access_time),
            hintText: 'Enter the time of leaving',
            labelText: 'Departure Time',
          ),
          keyboardType: TextInputType.datetime,
          controller: departtime,
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            border: new OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15.0),
              ),
            ),
            filled: true,
            icon: const Icon(Icons.access_time),
            hintText: 'Enter a expected arrival time',
            labelText: 'In Time',
          ),
          keyboardType: TextInputType.datetime,
          controller: arrivaltime,
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            border: new OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15.0),
              ),
            ),
            filled: true,
            icon: const Icon(Icons.add_location),
            hintText: 'Enter the address of visit',
            labelText: 'Address',
          ),
          keyboardType: TextInputType.text,
          controller: address,
        ),
        SizedBox(height: 20),
        TextField(
          maxLines: null,
          minLines: 6,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
            border: new OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15.0),
              ),
            ),
            filled: true,
            icon: const Icon(Icons.assistant),
            hintText: 'Enter the Reason of leave',
            labelText: 'Reason',
          ),
          controller: reason,
        ),
        SizedBox(height: 40),
        Submitbutton(context),
      ],
    );
  }

  Widget Submitbutton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            senddata();
          },
          child: Container(
            child: Center(
              child: Text(
                "Submit",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.blue),
            width: MediaQuery.of(context).size.width * 0.3,
            height: 40,
          ),
        ),
      ],
    );
  }

  void senddata() async {
    CollectionReference leaves =
        FirebaseFirestore.instance.collection('leaves');
    leaves.add({
      'enrollno': widget.enrollno,
      'departdate': departdate.text,
      'arrivaldate': arrivaldate.text,
      'departtime': departtime.text,
      'arrivaltime': arrivaltime.text,
      'address': address.text,
      'reason': reason.text
    });
    setState(() {
      departdate.clear();
      departtime.clear();
      arrivaldate.clear();
      arrivaltime.clear();
      address.clear();
      reason.clear();
    });
  }
}
