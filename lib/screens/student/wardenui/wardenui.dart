import 'package:flutter/material.dart';
import 'package:hconnect/screens/student/success.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class wardenui extends StatefulWidget {
  wardenui();

  @override
  State<wardenui> createState() => _wardenuiState();
}

class _wardenuiState extends State<wardenui> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          leading: GestureDetector(
              onTap: () => {
                    Navigator.pop(context),
                  },
              child: Icon(Icons.arrow_back))),
      body: ListView(children: [
        DataTable(
          columns: [
            DataColumn(
              label: Text(
                'Name',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                'Phoneno',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                'Floor',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
          rows: <DataRow>[
            DataRow(
              cells: <DataCell>[
                DataCell(Text('parmeet')),
                DataCell(Text('9363638383')),
                DataCell(Text('3rd')),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('ram')),
                DataCell(Text('9828282282')),
                DataCell(Text('8th')),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('William')),
                DataCell(Text('9763737373')),
                DataCell(Text('8th')),
              ],
            ),
          ],
        )
      ]),
    );
  }
}
