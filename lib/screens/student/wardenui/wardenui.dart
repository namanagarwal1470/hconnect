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
      appBar: AppBar(
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
                'Email',
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
                DataCell(Text('Sarah')),
                DataCell(Text('19')),
                DataCell(Text('Student')),
                DataCell(Text('Professor')),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('Janine')),
                DataCell(Text('43')),
                DataCell(Text('Professor')),
                DataCell(Text('Professor')),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('William')),
                DataCell(Text('27')),
                DataCell(Text('Associate Professor')),
                DataCell(Text('Professor')),
              ],
            ),
          ],
        )
      ]),
    );
  }
}
