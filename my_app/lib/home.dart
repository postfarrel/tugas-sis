import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final name = TextEditingController();
    String gender = 'Male';

    return Padding(
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
            }).toList()));
  }
}
