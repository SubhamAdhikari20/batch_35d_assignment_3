import 'package:batch_35d_assignment_3/common/my_snackbar.dart';
import 'package:batch_35d_assignment_3/widgets/my_custom_button.dart';
import 'package:batch_35d_assignment_3/widgets/my_custom_text_field.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class AreaOfCircleScreen extends StatefulWidget {
  const AreaOfCircleScreen({super.key});

  @override
  State<AreaOfCircleScreen> createState() => _AreaOfCircleScreenState();
}

class _AreaOfCircleScreenState extends State<AreaOfCircleScreen> {
  final _areaOfCircleFormKey = GlobalKey<FormState>();
  final TextEditingController radiusController = TextEditingController();

  double area = 0;
  String result = "";

  void areaOfCircle(double radius) {
    setState(() {
      area = pi * radius * radius;
      result = "The area of circle is: ${area.toStringAsFixed(2)}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Area of Ciricle"),
        backgroundColor: Colors.lightGreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _areaOfCircleFormKey,
          child: Column(
            children: [
              SizedBox(height: 20),
              MyCustomTextField(
                controller: radiusController,
                hintText: "e.g 5.",
                labelText: "Enter radius",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a number";
                  }
                  final number = double.tryParse(value.trim());
                  if (number == null) {
                    return "Please enter a valid number";
                  }
                  if (number < 0) {
                    return "Number cannot be negative";
                  }
                  return null;
                },
              ),
              SizedBox(height: 40),
              MyCustomButton(
                onPressed: () {
                  if (_areaOfCircleFormKey.currentState?.validate() == true) {
                    areaOfCircle(double.parse(radiusController.text));
                    showMySnackBar(context: context, message: result);
                  }
                },
                text: "Calculate",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
