import 'package:flutter/material.dart';
import 'package:myapp/Custom_Widgets/custom_appbar.dart';
import 'package:myapp/Custom_Widgets/custom_elevated_button.dart';
import 'package:myapp/Custom_Widgets/custom_textfeild.dart';
import 'package:myapp/Custom_Widgets/select_workout_type.dart';
import 'package:myapp/utils/assets.dart';
import 'package:myapp/utils/colors.dart';
import 'package:myapp/utils/data.dart';

class ProtienIntakePage extends StatefulWidget {
  const ProtienIntakePage({super.key});

  @override
  State<ProtienIntakePage> createState() => _ProtienIntakePageState();
}

GlobalKey<FormState> form2 = GlobalKey<FormState>();
double loweistProtienIntake = 0.0;
double highistProtienIntake = 0.0;
double normalProteinIntake = 0.0;

class _ProtienIntakePageState extends State<ProtienIntakePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: customAppBarr("Protien Intake Calculator"),
        body: Padding(
          padding: const EdgeInsets.all(5),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 400,
                  height: 230,
                  child: Image.asset(
                    fit: BoxFit.fitHeight,
                    protienBanner,
                  ),
                ),
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
                            if (user["isBodybuilder"] == false) {
                              normalProteinIntake = 0.8 * user["weight"];
                            } else {
                              highistProtienIntake = 2.0 * user["weight"];

                              loweistProtienIntake = 1.2 * user["weight"];
                            }
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
                              form2.currentState?.validate();
                              form2.currentState?.save();
                              normalProteinIntake =
                                  (normalProteinIntake * 100).round() / 100;
                              highistProtienIntake =
                                  (highistProtienIntake * 100).round() / 100;
                              loweistProtienIntake =
                                  (loweistProtienIntake * 100).round() / 100;
                            });
                          },
                          text: "OK"),
                      const SizedBox(
                        height: 35,
                      ),
                    ],
                  ),
                ),
                normalProteinIntake +
                            highistProtienIntake +
                            loweistProtienIntake !=
                        0.0
                    ? user["isBodybuilder"] == true
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "You Must Eat Between",
                                style: TextStyle(
                                    color: primaryColor, fontSize: 16),
                              ),
                              Text(
                                "$loweistProtienIntake grams To $highistProtienIntake grams of Protien Daily",
                                style: TextStyle(
                                    color: primaryColor, fontSize: 16),
                              ),
                            ],
                          )
                        : Text(
                            " You Must eat $normalProteinIntake Grams of Protien Daily !",
                            style: TextStyle(color: primaryColor, fontSize: 16),
                          )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
