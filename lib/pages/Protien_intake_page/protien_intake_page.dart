import 'package:flutter/material.dart';
import 'package:myapp/Custom_Widgets/custom_banner.dart';
import 'package:myapp/Custom_Widgets/custom_elevated_button.dart';
import 'package:myapp/Custom_Widgets/custom_textfeild.dart';
import 'package:myapp/Custom_Widgets/select_gender_radio.dart';
import 'package:myapp/Custom_Widgets/select_workout_type.dart';
import 'package:myapp/Custom_Widgets/weight_diffrence.dart';
import 'package:myapp/pages/Ideal_bodyweight_page/ideal_bw_page.dart';
import 'package:myapp/utils/colors.dart';
import 'package:myapp/utils/data.dart';

class ProtienIntakePage extends StatefulWidget {
  const ProtienIntakePage({super.key});

  @override
  State<ProtienIntakePage> createState() => _ProtienIntakePageState();
}

GlobalKey<FormState> form2 = GlobalKey<FormState>();

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
                Form(
                  key: form2,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text('Are You a BodyBuilder ?',
                          style: TextStyle(color: secondColor, fontSize: 16)),
                      const CustomBodyTypeRatio(),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomTextfeild(
                          hintText: "Enter your Weight in KG",
                          onSaved: (value) {
                            user["weight"] = double.parse(value!);
                            user["gender"] == "Male"
                                ? idealBodyWeight =
                                    50 + (0.91 * (user["height"] - 152.4))
                                : idealBodyWeight =
                                    45.5 + (0.91 * (user["height"] - 152.4));
                          },
                          text: "Weight ",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter your weight please";
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomElevatedButton(
                          onpressed: () {
                            setState(() {
                              form1.currentState?.validate();
                              form1.currentState?.save();
                              idealBodyWeight =
                                  (idealBodyWeight * 100).round() / 100;
                            });
                          },
                          text: "OK"),
                      const SizedBox(
                        height: 35,
                      ),
                      idealBodyWeight != 0.0
                          ? Text(
                              " Your Ideal Body Weight is $idealBodyWeight KG",
                              style:
                                  TextStyle(color: primaryColor, fontSize: 16),
                            )
                          : Container(),
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Text(
                          diffrence(user["weight"], idealBodyWeight),
                          style: TextStyle(color: primaryColor, fontSize: 16),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
