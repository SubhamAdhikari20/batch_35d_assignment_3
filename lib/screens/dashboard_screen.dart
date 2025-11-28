import 'package:batch_35d_assignment_3/screens/area_of_circle_screen.dart';
import 'package:batch_35d_assignment_3/screens/arithmetic_screen.dart';
import 'package:batch_35d_assignment_3/screens/simple_interest_screen.dart';
import 'package:batch_35d_assignment_3/widgets/my_custom_button.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard Screen"),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(height: 10),
            MyCustomButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ArithmeticScreen()),
                );
              },
              text: "Arithmetic Screen",
              color: Colors.lightBlueAccent,
            ),
            SizedBox(height: 10),
            MyCustomButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SimpleInterestScreen(),
                  ),
                );
              },
              text: "Simple Interest Screen",
              color: Colors.green,
            ),
            SizedBox(height: 10),
            MyCustomButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AreaOfCircleScreen()),
                );
              },
              text: "Area of Circle Screen",
              color: Colors.blueGrey,
            ),
          ],
        ),
      ),
    );
  }
}
