import 'package:flutter/material.dart';
import 'package:myapp/Custom_Widgets/custom_banner.dart';
import 'package:myapp/Custom_Widgets/custom_button.dart';
import 'package:myapp/utils/colors.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBarr,
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      "apollo is design the app ....",
                      textAlign: TextAlign.start,
                      style: TextStyle(color: primaryColor),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      padding: const EdgeInsetsDirectional.all(2),
                      width: 350,
                      height: 180,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "HI !",
                            style: TextStyle(color: primaryColor, fontSize: 35),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            "Wellcome to Fitmesure",
                            style: TextStyle(color: primaryColor, fontSize: 25),
                          ),
                          Text(
                            "What do you wnat to know ??",
                            style: TextStyle(color: primaryColor, fontSize: 25),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomButton(
                        onPressed: () {}, text: "My ideal body weight"),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomButton(
                        onPressed: () {},
                        text: "How much protien should i eat ??"),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
