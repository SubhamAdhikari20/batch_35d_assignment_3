import 'package:batch_35d_assignment_3/common/my_snackbar.dart';
import 'package:batch_35d_assignment_3/widgets/my_custom_button.dart';
import 'package:batch_35d_assignment_3/widgets/my_custom_text_field.dart';
import 'package:flutter/material.dart';

class ArithmeticScreen extends StatefulWidget {
  const ArithmeticScreen({super.key});

  @override
  State<ArithmeticScreen> createState() => _ArithmeticScreenState();
}

class _ArithmeticScreenState extends State<ArithmeticScreen> {
  final _arithmeticFormKey = GlobalKey<FormState>();

  final TextEditingController firstController = TextEditingController();
  final TextEditingController secondController = TextEditingController();

  double sum = 0;
  double diff = 0;
  double product = 0;
  double div = 0;

  void add(double num1, double num2) {
    setState(() {
      sum = num1 + num2;
    });
  }

  void subtract(double num1, double num2) {
    setState(() {
      diff = num1 - num2;
    });
  }

  void multiplication(double num1, double num2) {
    setState(() {
      product = num1 * num2;
    });
  }

  void division(double num1, double num2) {
    setState(() {
      div = num1 / num2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Arithmetic Screen"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _arithmeticFormKey,
          child: Column(
            children: [
              SizedBox(height: 20),
              MyCustomTextField(
                controller: firstController,
                hintText: "e.g 5.",
                labelText: "Enter first number",
              ),
              SizedBox(height: 20),
              MyCustomTextField(
                controller: secondController,
                hintText: "e.g 7.",
                labelText: "Enter second number",
              ),
              SizedBox(height: 40),
              MyCustomButton(
                onPressed: () {
                  if (_arithmeticFormKey.currentState?.validate() == true) {
                    add(
                      double.parse(firstController.text),
                      double.parse(secondController.text),
                    );
                    showMySnackBar(
                      context: context,
                      message:
                          "The sum of ${firstController.text} and ${secondController.text} is $sum.",
                    );
                  }
                },
                text: "Addition",
              ),
              // SizedBox(height: 20),
              // Text('Sum: $sum'),
              SizedBox(height: 20),
              MyCustomButton(
                onPressed: () {
                  if (_arithmeticFormKey.currentState?.validate() == true) {
                    subtract(
                      double.parse(firstController.text),
                      double.parse(secondController.text),
                    );
                    showMySnackBar(
                      context: context,
                      message:
                          "The difference of ${firstController.text} and ${secondController.text} is $diff.",
                    );
                  }
                },
                text: "Subtration",
                color: Colors.green,
              ),
              // SizedBox(height: 20),
              // Text('Difference: $diff'),
              SizedBox(height: 20),
              MyCustomButton(
                onPressed: () {
                  if (_arithmeticFormKey.currentState?.validate() == true) {
                    multiplication(
                      double.parse(firstController.text),
                      double.parse(secondController.text),
                    );
                    showMySnackBar(
                      context: context,
                      message:
                          "The product of ${firstController.text} and ${secondController.text} is $product.",
                    );
                  }
                },
                text: "Product",
                color: Colors.blueGrey,
              ),
              // SizedBox(height: 20),
              // Text('Difference: $product'),
              SizedBox(height: 20),
              MyCustomButton(
                onPressed: () {
                  if (_arithmeticFormKey.currentState?.validate() == true) {
                    division(
                      double.parse(firstController.text),
                      double.parse(secondController.text),
                    );
                    showMySnackBar(
                      context: context,
                      message:
                          "The division of ${firstController.text} and ${secondController.text} is ${div.toStringAsFixed(2)}.",
                    );
                  }
                },
                text: "Division",
                color: Colors.grey,
              ),
              // SizedBox(height: 20),
              // Text('Division: ${div.toStringAsFixed(2)}'),
            ],
          ),
        ),
      ),
    );
  }
}
