import 'package:flutter/material.dart';

class ComplainForm extends StatefulWidget {
  @override
  _ComplainFormState createState() => _ComplainFormState();
}

class _ComplainFormState extends State<ComplainForm> {
  GlobalKey<FormState> _key = new GlobalKey();
  bool _autovalidate = false;
  String complain_type = 'Electricity';
  String message = 'helo';
  List<DropdownMenuItem<String>> items = [
    new DropdownMenuItem(
      child: new Text('Electricity'),
      value: 'Electricity',
    ),
    new DropdownMenuItem(
      child: new Text('Furniture'),
      value: 'Furniture',
    ),
    new DropdownMenuItem(
      child: new Text('Network'),
      value: 'Network',
    ),
    new DropdownMenuItem(
      child: new Text('Water'),
      value: 'Water',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new SingleChildScrollView(
        child: new Container(
          padding: new EdgeInsets.all(15.0),
          child: FormUI(),
        ),
      ),
    );
  }

  Widget FormUI() {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 40, bottom: 40),
              child: Text(
                "Complaint Form",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        Container(
          child: Text(
            "Complaint Type",
            style: TextStyle(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 10),
        Row(
          children: <Widget>[
            DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.grey[200], //background color of dropdown button
                  border: Border.all(
                      color: Colors.black), //border of dropdown button
                  borderRadius: BorderRadius.circular(
                      10), //border raiuds of dropdown button
                ),
                child: Padding(
                  padding: EdgeInsets.only(right: 10, left: 10),
                  child: new DropdownButtonHideUnderline(
                      child: new DropdownButton(
                    borderRadius: BorderRadius.circular(20),
                    items: items,
                    hint: new Text('Select type of complain.'),
                    value: complain_type,
                    onChanged: (val) {
                      setState(() {
                        complain_type = val.toString();
                      });
                    },
                  )),
                ))
          ],
        ),
        SizedBox(height: 30),
        new TextFormField(
          decoration: new InputDecoration(
            hintText: 'Message',
            border: new OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15.0),
              ),
            ),
            filled: true,
          ),
          onChanged: (val) {},
          maxLines: 5,
          maxLength: 256,
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
