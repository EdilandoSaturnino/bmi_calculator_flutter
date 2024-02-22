import 'package:bmi_calculator/services/colors.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final double bmiResult;
  final String bmiText;
  final String resultTextMessage;

  const ResultScreen(
      {Key? key,
      required this.bmiResult,
      required this.bmiText,
      required this.resultTextMessage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        title: const Text(
          'RESULTADO',
          style: TextStyle(
            color: kBottomContainerColour,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                decoration: BoxDecoration(
                  color: kActiveCardColour,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text(bmiText,
                          style: const TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 20))
                    ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          bmiResult.toStringAsFixed(1),
                          style: const TextStyle(
                              color: kBottomContainerColour,
                              fontWeight: FontWeight.bold,
                              fontSize: 100),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            resultTextMessage,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: kBottomContainerColour,
                              fontWeight: FontWeight.w500,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        height: 50,
        color: kBottomContainerColour,
        shape: const CircularNotchedRectangle(),
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            height: 50,
            alignment: Alignment.center,
            child: const Text(
              "REFAZER",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
