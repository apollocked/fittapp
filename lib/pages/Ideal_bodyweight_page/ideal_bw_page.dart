import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/Custom_Widgets/custom_banner.dart';
import 'package:myapp/Custom_Widgets/select_gender_radio.dart';
import 'package:myapp/Custom_Widgets/weight_diffrence.dart';
import 'package:myapp/utils/colors.dart';
import 'package:myapp/utils/data.dart';

class IdealBodyWeightPage extends StatefulWidget {
  const IdealBodyWeightPage({super.key});

  @override
  State<IdealBodyWeightPage> createState() => _IdealBodyWeightPageState();
}

GlobalKey<FormState> form1 = GlobalKey<FormState>();
bool isMale = false;
double idealBodyWeight = 0.0;
double currentBodyWeight = 0.0;
double heightInCentimeters = 0.0;
String gender = "Male";

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
                Form(
                  key: form1,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text('Select Your Gender',
                          style: TextStyle(color: secondColor, fontSize: 16)),
                      CustomRatio(
                        value2: "Female",
                        value1: 'Male',
                        vargroup: user["gender"],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter your height please";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          user["height"] = double.parse(value!);
                        },
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(
                              RegExp(r'^\d*\.?\d*')) // Only allow digits
                        ],
                        style: TextStyle(color: primaryColor),
                        decoration: InputDecoration(
                          errorStyle: const TextStyle(fontSize: 15),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                style: BorderStyle.solid,
                                color: secondColor,
                                width: 2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          hintText: "Enter your Height in CM",
                          hintStyle: TextStyle(color: greyColor),
                          enabled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: secondColor,
                                style: BorderStyle.solid,
                                width: 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          label: Text(
                            "Height ",
                            style: TextStyle(color: secondColor),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter your weight please";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          user["weight"] = double.parse(value!);
                          user["gender"] == "Male"
                              ? idealBodyWeight =
                                  50 + (0.91 * (user["height"] - 152.4))
                              : idealBodyWeight =
                                  45.5 + (0.91 * (user["height"] - 152.4));
                        },
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(
                              RegExp(r'^\d*\.?\d*'))
                        ],
                        style: TextStyle(color: primaryColor),
                        decoration: InputDecoration(
                          errorStyle: const TextStyle(fontSize: 15),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: secondColor,
                                style: BorderStyle.solid,
                                width: 2),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          hintText: "Enter your Weight in KG",
                          hintStyle: TextStyle(color: greyColor),
                          enabled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: secondColor,
                                style: BorderStyle.solid,
                                width: 1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          label: Text(
                            "Weight ",
                            style: TextStyle(color: secondColor),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: backgroundColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  side: BorderSide(
                                      color: primaryColor, width: 1)),
                              minimumSize: const Size(70, 35)),
                          onPressed: () {
                            setState(() {
                              form1.currentState?.validate();
                              form1.currentState?.save();
                              idealBodyWeight =
                                  (idealBodyWeight * 100).round() / 100;
                            });
                          },
                          child: Text(
                            "OK",
                            style: TextStyle(color: secondColor),
                          )),
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
