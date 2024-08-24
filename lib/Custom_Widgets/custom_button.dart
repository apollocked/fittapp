import 'dart:math';

import 'package:flutter/material.dart';
import 'package:myapp/utils/colors.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
      required this.onPress,
      required this.text,
      required this.context});
  BuildContext context;
  Function onPress;
  String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 255,
      child: FloatingActionButton(
        heroTag: (text + Random().toString()),
        isExtended: true,
        onPressed: onPress(),
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
