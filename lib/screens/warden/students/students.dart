import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hconnect/screens/warden/students/wardenstudentdetails.dart';

class studentpage extends StatefulWidget {
  studentpage({Key? key}) : super(key: key);

  @override
  _studentpageState createState() => _studentpageState();
}

class _studentpageState extends State<studentpage> {
  List enrollno = [];
  List enrollno2 = [];
  List name2 = [];
  List roomno = [];
  List roomno2 = [];
  List names = [];
  bool isloading = true;
  TextEditingController editingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetch_all_data();
  }

  void filterSearchResults(String query) {
    var dummySearchList = [];
    dummySearchList.addAll(name2);
    if (query.toLowerCase().isNotEmpty) {
      List<String> dummyroomdata = [];
      List<String> dummyenrolldata = [];
      List<String> dummynamedata = [];
      dummySearchList.forEach((item) {
        if (item.toLowerCase().contains(query)) {
          dummynamedata.add(item);
          dummyenrolldata.add(enrollno2[name2.indexOf(item)]);
          dummyroomdata.add(roomno2[name2.indexOf(item)]);
        }
      });
      setState(() {
        enrollno.clear();
        roomno.clear();
        names.clear();
        enrollno.addAll(dummyenrolldata);
        names.addAll(dummynamedata);
        roomno.addAll(dummyroomdata);
      });
      return;
    } else {
      setState(() {
        enrollno.clear();
        roomno.clear();
        names.clear();
        roomno = List.from(roomno2);
        names = List.from(name2);
        enrollno = List.from(enrollno2);
      });
    }
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
                    child: Text("All Students",
                        style: TextStyle(color: Colors.white, fontSize: 30)),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 30.0, right: 30.0, bottom: 20.0),
                child: TextField(
                  cursorColor: Colors.white,
                  style: TextStyle(color: Colors.white),
                  onChanged: (value) {
                    filterSearchResults(value);
                  },
                  controller: editingController,
                  decoration: InputDecoration(
                      iconColor: Colors.white,
                      labelText: "Search",
                      labelStyle: TextStyle(color: Colors.white),
                      hintStyle: TextStyle(color: Colors.black),
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search, color: Colors.white),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 2.0),
                          borderRadius:
                              BorderRadius.all(Radius.circular(40.0))),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 2.0),
                          borderRadius:
                              BorderRadius.all(Radius.circular(40.0)))),
                ),
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
                                enrollno[index], names[index], roomno[index]);
                          }),
                ),
              ),
            ],
          ),
        ));
  }

  Widget Cont(String text1, String text2, String text3) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => wardenstudentdetails(text1)));
      },
      child: Container(
          height: 80,
          margin: EdgeInsets.only(left: 15, right: 15, top: 10),
          decoration: BoxDecoration(
              color: Colors.grey[300], borderRadius: BorderRadius.circular(30)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                child: Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    text2,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Text(
                  text1 + "   (" + text3 + ")",
                  overflow: TextOverflow.ellipsis,
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
          await FirebaseFirestore.instance.collection('Userprofile');
      List<DocumentSnapshot> studentdocs =
          (await data.where("type", isEqualTo: "student").get()).docs;

      List<String> e = studentdocs.map((e) => e['enrollno'] as String).toList();
      List<String> r = studentdocs.map((e) => e['roomno'] as String).toList();
      List<String> n = studentdocs.map((e) => e['name'] as String).toList();

      setState(() {
        enrollno = e;
        roomno = r;
        names = n;
        roomno2 = List.from(roomno);
        enrollno2 = List.from(enrollno);
        name2 = List.from(names);

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
