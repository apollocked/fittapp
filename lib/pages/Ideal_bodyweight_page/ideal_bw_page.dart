import 'package:flutter/material.dart';
import 'package:myapp/Custom_Widgets/custom_banner.dart';
import 'package:myapp/utils/colors.dart';

class IdealBodyWeightPage extends StatefulWidget {
  const IdealBodyWeightPage({super.key});

  @override
  State<IdealBodyWeightPage> createState() => _IdealBodyWeightPageState();
}

class _IdealBodyWeightPageState extends State<IdealBodyWeightPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: customAppBarr,
        body: Padding(
          padding: const EdgeInsets.all(5),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "you are in Ideal body weight calculator page ",
                  style: TextStyle(color: primaryColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
