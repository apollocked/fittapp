import 'package:flutter/material.dart';
import 'package:myapp/utils/colors.dart';

class SelectGenderRadio extends StatefulWidget {
  const SelectGenderRadio({super.key});

  @override
  State<SelectGenderRadio> createState() => _SelectGenderRadioState();
}
String gender = "Male";
class _SelectGenderRadioState extends State<SelectGenderRadio> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [    RadioListTile<String>(
                        fillColor: WidgetStatePropertyAll(secondColor),
                        title:
                            Text('Male', style: TextStyle(color: primaryColor)),
                        value: 'Male',
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = value!;
                          });
                        },
                      ),
                      RadioListTile<String>(
                        fillColor: WidgetStatePropertyAll(secondColor),
                        title: Text(
                          'Female',
                          style: TextStyle(color: primaryColor),
                        ),
                        value: 'Female',
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = value!;
                          });
                        },
                      ),],
    );
  }
}