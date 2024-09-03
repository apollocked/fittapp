import 'package:flutter/material.dart';
import 'package:myapp/pages/Ideal_bodyweight_page/ideal_bw_page.dart';
import 'package:myapp/utils/colors.dart';
import 'package:myapp/utils/data.dart';

class CustomRatio extends StatefulWidget {
  CustomRatio(
      {super.key,
      required this.value1,
      required this.value2,
      required this.vargroup});
  final String value1;
  final String value2;
  String vargroup;

  @override
  State<CustomRatio> createState() => _CustomRatioState();
}

class _CustomRatioState extends State<CustomRatio> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile<String>(
          fillColor: WidgetStatePropertyAll(secondColor),
          title: Text(widget.value1, style: TextStyle(color: primaryColor)),
          value: widget.value1,
          groupValue: user["gender"],
          onChanged: (value) {
            setState(() {
              user["gender"] = value!;
            });
          },
        ),
        RadioListTile<String>(
          fillColor: WidgetStatePropertyAll(secondColor),
          title: Text(
            widget.value2,
            style: TextStyle(color: primaryColor),
          ),
          value: widget.value2,
          groupValue: user["gender"],
          onChanged: (value) {
            setState(() {
              user["gender"] = value!;
            });
          },
        ),
      ],
    );
  }
}
