import 'package:flutter/material.dart';
import 'package:calculator_app/components/my_button.dart';
import 'package:calculator_app/constant.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String input = '';
  String result = '0';

  void buttonPressed(String value) {
    setState(() {
      if (value == "AC") {
        input = '';
        result = '0';
      } else if (value == "DEL") {
        input = input.isNotEmpty ? input.substring(0, input.length - 1) : '';
      } else if (value == "=") {
        try {
          Parser p = Parser();
          Expression exp = p.parse(input.replaceAll('x', '*'));
          ContextModel cm = ContextModel();
          result = exp.evaluate(EvaluationType.REAL, cm).toString();
        } catch (e) {
          result = "Error";
        }
      } else {
        input += value;
      }
    });
  }

  Widget buildButton(String text, {Color? color, Color? textColor}) {
    return MyButton(
      title: text,
      color: color ?? btnColor,
      textColor: textColor ?? btnTextColor,
      onPress: () => buttonPressed(text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [bgColor1, bgColor2, bgColor3],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.bottomRight,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        input,
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.white70,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        result,
                        style: TextStyle(
                          fontSize: 42,
                          color: resultColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Row(children: [
                    buildButton("AC"),
                    buildButton("DEL"),
                    buildButton("%"),
                    buildButton("/", textColor: equalBtnColor),
                  ]),
                  Row(children: [
                    buildButton("7"),
                    buildButton("8"),
                    buildButton("9"),
                    buildButton("x", textColor: equalBtnColor),
                  ]),
                  Row(children: [
                    buildButton("4"),
                    buildButton("5"),
                    buildButton("6"),
                    buildButton("-", textColor: equalBtnColor),
                  ]),
                  Row(children: [
                    buildButton("1"),
                    buildButton("2"),
                    buildButton("3"),
                    buildButton("+", textColor: equalBtnColor),
                  ]),
                  Row(children: [
                    buildButton("0"),
                    buildButton("."),
                    buildButton("=", color: equalBtnColor, textColor: Colors.black),
                    buildButton("00"),
                  ]),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
