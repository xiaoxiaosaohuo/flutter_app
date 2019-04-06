import 'package:flutter/material.dart';

class DataTableDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
      // TODO: implement createState
      return DataTableDemoState();
    }
}

class DataTableDemoState extends State<DataTableDemo>{

  Widget bodyData() => DataTable(
      onSelectAll: (b) {},
      sortColumnIndex: 1,
      sortAscending: true,
      columns: <DataColumn>[
        DataColumn(
          label: Text("First Name"),
          numeric: false,
          onSort: (i, b) {
            print("$i $b");
            setState(() {
              names.sort((a, b) => a.firstName.compareTo(b.firstName));
            });
          },
          tooltip: "To display first name of the Name",
        ),
        DataColumn(
          label: Text("Last Name"),
          numeric: false,
          onSort: (i, b) {
            print("$i $b");
            setState(() {
              names.sort((a, b) => a.lastName.compareTo(b.lastName));
            });
          },
          tooltip: "To display last name of the Name",
        ),
      ],
      rows: names
          .map(
            (name) => DataRow(
                  cells: [
                    DataCell(
                      Text(name.firstName),
                      showEditIcon: false,
                      placeholder: false,
                    ),
                    DataCell(
                      Text(name.lastName),
                      showEditIcon: false,
                      placeholder: false,
                    )
                  ],
                ),
          )
          .toList());

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return MaterialApp(
        title:"dataTable",
        theme: ThemeData(primarySwatch: Colors.green),
        home: Scaffold(
          appBar: AppBar(
            title: Text("dataTable"),
          ),
          body: Container(
            child: bodyData(),
          ),
        ),
      );
    }
}

class Name{
  String firstName;
  String lastName;
  Name({this.firstName,this.lastName});
}

var names = <Name>[
  Name(firstName: "鑫",lastName: "金"),
  Name(firstName: "1",lastName: "金"),
  Name(firstName: "2",lastName: "金"),
  Name(firstName: "3",lastName: "金"),
  Name(firstName: "4",lastName: "金"),
];
