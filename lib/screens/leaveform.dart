import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LeaveForm extends StatefulWidget {
  @override
  _LeaveFormState createState() => _LeaveFormState();
}

class _LeaveFormState extends State<LeaveForm> {
  GlobalKey<FormState> _key = new GlobalKey();

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
            icon: const Icon(Icons.person),
            filled: true,
            hintText: 'Enter your first and last name',
            labelText: 'Name',
          ),
          onChanged: (value) {},
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
            icon: const Icon(Icons.person),
            hintText: 'Enter your enrollno',
            labelText: 'Enrollno',
          ),
          onChanged: (value) {},
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
            labelText: 'Date of Departure',
          ),
          keyboardType: TextInputType.datetime,
          onChanged: (value) {},
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
          onChanged: (value) {},
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
          onChanged: (value) {},
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
          onChanged: (value) {},
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
          onChanged: (value) {},
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
          onChanged: (value) {},
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
          onTap: () {},
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
}
