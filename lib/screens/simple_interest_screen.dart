import 'package:batch_35d_assignment_3/common/my_snackbar.dart';
import 'package:batch_35d_assignment_3/widgets/my_custom_button.dart';
import 'package:batch_35d_assignment_3/widgets/my_custom_text_field.dart';
import 'package:flutter/material.dart';

class SimpleInterestScreen extends StatefulWidget {
  const SimpleInterestScreen({super.key});

  @override
  State<SimpleInterestScreen> createState() => _SimpleInterestScreenState();
}

class _SimpleInterestScreenState extends State<SimpleInterestScreen> {
  final _simpleInterestFormKey = GlobalKey<FormState>();
  final TextEditingController principalController = TextEditingController();
  final TextEditingController rateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  String result = "";
  double si = 0;

  void simpleInterest(double principal, double rate, double time) {
    setState(() {
      si = (principal * rate * time) / 100;
      result = "The simple interest is: ${si.toStringAsFixed(2)}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Interest"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _simpleInterestFormKey,
          child: Column(
            children: [
              SizedBox(height: 20),
              MyCustomTextField(
                controller: principalController,
                hintText: "e.g 5.",
                labelText: "Enter principal",
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
              SizedBox(height: 20),
              MyCustomTextField(
                controller: rateController,
                hintText: "e.g 7.",
                labelText: "Enter rate in %",
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
              SizedBox(height: 20),
              MyCustomTextField(
                controller: timeController,
                hintText: "e.g 5.",
                labelText: "Enter time in years",
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
                  if (_simpleInterestFormKey.currentState?.validate() == true) {
                    simpleInterest(
                      double.parse(principalController.text),
                      double.parse(rateController.text),
                      double.parse(timeController.text),
                    );
                    showMySnackBar(context: context, message: result);
                  }
                },
                text: "Calculate SI",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
