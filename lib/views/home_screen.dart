import 'dart:math';

import 'package:bmi_calculator/widgets/counter_card.dart';
import 'package:bmi_calculator/widgets/gender_selection_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/services/colors.dart';
import 'package:bmi_calculator/views/result_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double currentSliderValue = 170.0;
  int currentWeightValue = 60;
  int currentAgeValue = 20;
  String? selectedGender;

  void _selectGender(String gender) {
    setState(() {
      selectedGender = gender;
    });
  }

  void _increment() {
    setState(() {
      currentWeightValue++;
    });
  }

  void _decrement() {
    setState(() {
      if (currentWeightValue > 0) {
        currentWeightValue--;
      }
    });
  }

  void _incrementAge() {
    setState(() {
      currentAgeValue++;
    });
  }

  void _decrementAge() {
    setState(() {
      if (currentAgeValue > 0) {
        currentAgeValue--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        title: const Text(
          'BMI CALCULATOR',
          style: TextStyle(
            color: kBottomContainerColour,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: Row(
                    children: [
                      GenderSelectionCard(
                        icon: FontAwesomeIcons.mars,
                        label: "MASCULINO",
                        isSelected: selectedGender == "masculino",
                        onSelect: _selectGender,
                      ),
                      const SizedBox(width: 8.0),
                      GenderSelectionCard(
                        icon: FontAwesomeIcons.venus,
                        label: "FEMININO",
                        isSelected: selectedGender == "feminino",
                        onSelect: _selectGender,
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: kActiveCardColour,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const Text(
                        "ALTURA",
                        style: TextStyle(
                          color: kBottomContainerColour,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            currentSliderValue.toStringAsFixed(0),
                            style: const TextStyle(
                              color: kBottomContainerColour,
                              fontWeight: FontWeight.bold,
                              fontSize: 50,
                            ),
                          ),
                          const Text("cm")
                        ],
                      ),
                      Slider(
                        value: currentSliderValue,
                        min: 100,
                        activeColor: kBottomContainerColour,
                        max: 220,
                        divisions: 120,
                        label: currentSliderValue.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            currentSliderValue = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Row(
                    children: [
                      CounterCard(
                        title: "PESO",
                        value: currentWeightValue,
                        increment: _increment,
                        decrement: _decrement,
                      ),
                      const SizedBox(width: 15.0),
                      CounterCard(
                        title: "IDADE",
                        value: currentAgeValue,
                        increment: _incrementAge,
                        decrement: _decrementAge,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const BottomAppBar(
        height: 50,
        color: Colors.white,
        shape: CircularNotchedRectangle(),
      ),
      floatingActionButton: FloatingActionButton.small(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        backgroundColor: const Color.fromRGBO(6, 70, 127, 1),
        onPressed: () {
          double foda = currentSliderValue / 100;
          double bmiResult = (currentWeightValue / pow(foda, 2));

          String bmiText = "";
          String resultTextMessage = "";

          if (bmiResult < 18.5) {
            bmiText = "Abaixo do peso";
          } else if (bmiResult < 25) {
            bmiText = "Peso normal";
          } else if (bmiResult < 30) {
            bmiText = "Sobrepeso";
          } else if (bmiResult < 35) {
            bmiText = "Obesidade Classe I";
          } else if (bmiResult < 40) {
            bmiText = "Obesidade Classe II";
          } else {
            bmiText = "Obesidade Classe III (obesidade mórbida)";
          }

          switch (bmiText) {
            case 'Abaixo do peso':
              resultTextMessage =
                  'Você está abaixo do peso. Tente aumentar sua ingestão de alimentos nutritivos.';
            case 'Peso normal':
              resultTextMessage =
                  'Você tem um peso corporal normal. Bom trabalho!';
            case 'Sobrepeso':
              resultTextMessage =
                  'Você está com sobrepeso. Tente diminuir a ingestão de calorias e fazer mais exercícios.';
            case 'Obesidade Classe I':
              resultTextMessage =
                  'Você está com obesidade Classe I. É importante consultar um médico para um plano de perda de peso.';
            case 'Obesidade Classe II':
              resultTextMessage =
                  'Você está com obesidade Classe II. Consulte um médico para orientações sobre perda de peso e possíveis intervenções.';
            case 'Obesidade Classe III (obesidade mórbida)':
              resultTextMessage =
                  'Você está com obesidade Classe III (obesidade mórbida). Consulte imediatamente um médico para tratamento e intervenções.';
            default:
              resultTextMessage = '';
          }

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ResultScreen(
                  bmiResult: bmiResult,
                  bmiText: bmiText,
                  resultTextMessage: resultTextMessage),
            ),
          );
        },
        tooltip: 'Ir para o resultado',
        child: const Icon(Icons.check, color: Colors.white),
      ),
    );
  }
}
