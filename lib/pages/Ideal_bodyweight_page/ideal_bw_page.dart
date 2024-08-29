import 'package:flutter/material.dart';
import 'package:myapp/Custom_Widgets/custom_banner.dart';
import 'package:myapp/utils/colors.dart';

class IdealBodyWeightPage extends StatefulWidget {
  const IdealBodyWeightPage({super.key});

  @override
  State<IdealBodyWeightPage> createState() => _IdealBodyWeightPageState();
}

GlobalKey<FormState> form1 = GlobalKey<FormState>();
String gender = "Male";
bool isMale = false;
double idealBodyWeight = 0.0;
double heightInCentimeters = 0.0;

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
                Form(
                  key: form1,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text('whats your gender',
                          style: TextStyle(color: secondColor)),
                      RadioListTile<String>(
                        fillColor: WidgetStatePropertyAll(secondColor),
                        title:
                            Text('Male', style: TextStyle(color: primaryColor)),
                        value: 'Male',
                        groupValue: gender,
                        onChanged: (value) {
                          gender = value!;
                          setState(() {
                            isMale = true;
                          });
                        },
                      ),
                      RadioListTile<String>(
                        fillColor: WidgetStatePropertyAll(secondColor),
                        title: Text(
                          'Female',
                          style: TextStyle(color: primaryColor),
                        ),
                        value: 'Female',
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = value!;
                            isMale = false;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null) {
                            return "enter your height please";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          heightInCentimeters = double.parse(value!);
                        },
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: primaryColor),
                        decoration: InputDecoration(
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
                          if (value == null) {
                            return "enter your weight please";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          isMale
                              ? idealBodyWeight =
                                  50 + (0.91 * (heightInCentimeters - 152.4))
                              : idealBodyWeight =
                                  45.5 + (0.91 * (heightInCentimeters - 152.4));
                        },
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: primaryColor),
                        decoration: InputDecoration(
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
                              form1.currentState!.validate();
                              form1.currentState!.save();
                            });
                          },
                          child: Text(
                            "OK",
                            style: TextStyle(color: secondColor),
                          ))
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
