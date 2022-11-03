import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'employee_model.dart';
import 'restapi.dart';

class EmployeeList extends StatefulWidget {
  const EmployeeList({Key? key}) : super(key: key);

  @override
  EmployeeListState createState() => EmployeeListState();
}

class EmployeeListState extends State<EmployeeList> {
  DataService ds = DataService();

  List data = [];
  List<EmployeeModel> employee = [];

  selectAllEmployee() async {
    data = jsonDecode(await ds.selectAll('63476b2099b6c11c094bd508', 'office',
        'employee', '63476cea99b6c11c094bd5eb'));
    employee = data.map((e) => EmployeeModel.fromJson(e)).toList();

    setState(() {
      employee = employee;
    });

    if (kDebugMode) {
      print(employee.length);
      print(data);
    }
  }

  @override
  void initState() {
    selectAllEmployee();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee List'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "employee_form_add");
              },
              child: const Icon(
                Icons.add,
                size: 26.0,
              ),
            ),
          ),
          /*Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                showSearch(context: context, delegate: CustomSearchDelegate());
              },
              child: const Icon(
                Icons.search,
                size: 26,
              ),
            ),
          )*/
        ],
      ),
      body: ListView.builder(
        itemCount: employee.length,
        itemBuilder: (context, index) {
          final item = employee[index];
          return ListTile(
            title: Text(item.name),
            subtitle: Text(item.birthday),
          );
        },
      ),
    );
  }
}

/*class CustomSearchDelegate extends SearchDelegate {
  DataService ds = DataService();

  List data = [];
  List<EmployeeModel> employee = [];

  selectAllEmployee() async {
    data = jsonDecode(await ds.selectAll('63476b2099b6c11c094bd508', 'office',
        'employee', '63476cea99b6c11c094bd5eb'));
    employee = data.map((e) => EmployeeModel.fromJson(e)).toList();
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];

    for (var emp in employee) {
      if (emp.name.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(emp.name);
      }

      return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        },
      );
    }
  }
}*/
