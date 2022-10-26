import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_app_api/restapi.dart';

class EmployeeFormAdd extends StatefulWidget {
  const EmployeeFormAdd({Key? key}) : super(key: key);

  @override
  _EmployeeFormAddState createState() => _EmployeeFormAddState();
}

class _EmployeeFormAddState extends State<EmployeeFormAdd> {
  final name = TextEditingController();
  final phone = TextEditingController();
  final email = TextEditingController();
  final birthday = TextEditingController();
  final address = TextEditingController();
  String gender = 'Male';

  late Future<DateTime?> selectDate;
  String date = "-";

  DataService ds = DataService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: const Text("Employee Form Add"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              controller: name,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Full Name',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: DropdownButtonFormField(
                decoration: const InputDecoration(
                  filled: false,
                  border: InputBorder.none,
                ),
                value: gender,
                onChanged: (String? newValue) {
                  if (kDebugMode) {
                    print(newValue);
                  }

                  setState(() {
                    gender = newValue!;
                  });
                },
                items: <String>['Male', 'Female']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList()),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              controller: birthday,
              keyboardType: TextInputType.text,
              maxLines: 1,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Birthday",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              controller: phone,
              keyboardType: TextInputType.phone,
              maxLength: 1,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Phone Number",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              controller: email,
              keyboardType: TextInputType.emailAddress,
              maxLength: 1,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Email Address",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              controller: address,
              keyboardType: TextInputType.streetAddress,
              maxLength: 1,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "address",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: SizedBox(
              height: 45,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreen, elevation: 0),
                onPressed: () async {
                  String response = await ds.insertEmployee(
                      '63476cea99b6c11c094bd5eb',
                      name.text,
                      phone.text,
                      email.text,
                      address.text,
                      gender,
                      birthday.text,
                      address.text,
                      "-");

                  if (kDebugMode) {
                    print(response);
                  }
                },
                child: const Text("Submit"),
              ),
            ),
          )
        ],
      ),
    );
  }

  void showDialogPicker(BuildContext context) {
    selectDate = showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1988),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark(),
          child: child!,
        );
      },
    );

    selectDate.then((value) {
      setState(() {
        if (value == null) return;

        final DateFormat formatter = DateFormat('dd-mm-yyyy');
        final String formattedDate = formatter.format(value);
        birthday.text = formattedDate;
      });
    }, onError: (error) {
      if (kDebugMode) {
        print(error);
      }
    });
  }
}
