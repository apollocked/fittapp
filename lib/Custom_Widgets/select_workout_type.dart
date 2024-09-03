import 'package:flutter/material.dart';
import 'package:myapp/utils/colors.dart';
import 'package:myapp/utils/data.dart';

class CustomBodyTypeRatio extends StatefulWidget {
  const CustomBodyTypeRatio({
    super.key,
  });

  @override
  State<CustomBodyTypeRatio> createState() => _CustomBodyTypeRatio();
}

class _CustomBodyTypeRatio extends State<CustomBodyTypeRatio> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile<String>(
          fillColor: WidgetStatePropertyAll(secondColor),
          title: Text("No", style: TextStyle(color: primaryColor)),
          value: false.toString(),
          groupValue: user["isBodybuilder"].toString(),
          onChanged: (value) {
            setState(() {
              user["isBodybuilder"] = false;
            });
          },
        ),
        RadioListTile<String>(
          fillColor: WidgetStatePropertyAll(secondColor),
          title: Text(
            "Yes",
            style: TextStyle(color: primaryColor),
          ),
          value: true.toString(),
          groupValue: user["isBodybuilder"].toString(),
          onChanged: (value) {
            setState(() {
              user["isBodybuilder"] = true;
            });
          },
        ),
      ],
    );
  }
}
