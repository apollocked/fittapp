import 'package:flutter/material.dart';
import 'package:myapp/utils/colors.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton({super.key, required this.onPressed, required this.text});
  Function onPressed;
  String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 255,
      child: FloatingActionButton(
        isExtended: true,
        onPressed: onPressed(),
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child:  Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
