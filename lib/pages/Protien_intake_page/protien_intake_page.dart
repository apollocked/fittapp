import 'package:flutter/material.dart';
import 'package:myapp/Custom_Widgets/custom_banner.dart';
import 'package:myapp/utils/colors.dart';

class ProtienIntakePage extends StatefulWidget {
  const ProtienIntakePage({super.key});

  @override
  State<ProtienIntakePage> createState() => _ProtienIntakePageState();
}

class _ProtienIntakePageState extends State<ProtienIntakePage> {
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
                  "you are in protien calculator page ",
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
