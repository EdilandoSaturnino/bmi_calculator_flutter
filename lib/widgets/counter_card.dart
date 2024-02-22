import 'package:bmi_calculator/services/colors.dart';
import 'package:flutter/material.dart';

class CounterCard extends StatelessWidget {
  final String title;
  final int value;
  final VoidCallback increment;
  final VoidCallback decrement;

  const CounterCard({
    Key? key,
    required this.title,
    required this.value,
    required this.increment,
    required this.decrement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
        decoration: BoxDecoration(
          color: kActiveCardColour,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: [
            Text(title),
            Text(
              "$value",
              style: const TextStyle(
                color: kBottomContainerColour,
                fontWeight: FontWeight.bold,
                fontSize: 50,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Material(
                    borderRadius: BorderRadius.circular(10.0),
                    color: kBottomContainerColour,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10.0),
                      onTap: increment,
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Icon(Icons.add, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15.0),
                Expanded(
                  child: Material(
                    borderRadius: BorderRadius.circular(10.0),
                    color: kBottomContainerColour,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10.0),
                      onTap: decrement,
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Icon(Icons.remove, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
