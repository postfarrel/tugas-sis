import 'package:flutter/material.dart';
import 'package:my_app_api/employee_form_add.dart';
import 'package:my_app_api/employee_list.dart';

import 'employee_details.dart';
import 'employee_form_edit.dart';

//this is the work home

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learn Flutter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const EmployeeList(),
      routes: {
        'employee_list': (context) => const EmployeeList(),
        'employee_form_add': (context) => const EmployeeFormAdd(),
        'employee_form_edit': (context) => const EmployeeFormEdit(),
        'employee_detail': (context) => const EmployeeDetail(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
