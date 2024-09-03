import 'package:flutter/material.dart';
import 'package:myapp/utils/colors.dart';
import 'package:myapp/utils/data.dart';

class CustomGenderRatio extends StatefulWidget {
  const CustomGenderRatio({
    super.key,
    required this.value1,
    required this.value2,
  });
  final String value1;
  final String value2;

  @override
  State<CustomGenderRatio> createState() => _CustomRatioState();
}

class _CustomRatioState extends State<CustomGenderRatio> {
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
