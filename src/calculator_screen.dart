
import 'package:flutter/material.dart';
import 'calculator_logic.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final _logic = CalculatorLogic();
  String _output = "0";

  void _onButtonPressed(String buttonText) {
    setState(() {
      _output = _logic.processButton(buttonText);
    });
  }

  Widget _buildButton(String buttonText, {Color? buttonColor, Color? textColor}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor ?? Colors.grey.shade800,
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(22.0),
          ),
          onPressed: () => _onButtonPressed(buttonText),
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 26.0,
              fontWeight: FontWeight.bold,
              color: textColor ?? Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const operatorColor = Colors.orange;
    final numberColor = Colors.grey.shade800;
    final miscButtonColor = Colors.grey.shade600;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.symmetric(
                  vertical: 24.0,
                  horizontal: 12.0,
                ),
                child: Text(
                  _output,
                  style: const TextStyle(
                    fontSize: 68.0,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
              child: Column(
                children: [
                  Row(children: [
                    _buildButton("C", buttonColor: miscButtonColor, textColor: Colors.black),
                    _buildButton("+/-", buttonColor: miscButtonColor, textColor: Colors.black),
                    _buildButton("%", buttonColor: miscButtonColor, textColor: Colors.black),
                    _buildButton("/", buttonColor: operatorColor),
                  ]),
                  const SizedBox(height: 10),
                  Row(children: [
                    _buildButton("7", buttonColor: numberColor),
                    _buildButton("8", buttonColor: numberColor),
                    _buildButton("9", buttonColor: numberColor),
                    _buildButton("*", buttonColor: operatorColor),
                  ]),
                  const SizedBox(height: 10),
                  Row(children: [
                    _buildButton("4", buttonColor: numberColor),
                    _buildButton("5", buttonColor: numberColor),
                    _buildButton("6", buttonColor: numberColor),
                    _buildButton("-", buttonColor: operatorColor),
                  ]),
                  const SizedBox(height: 10),
                  Row(children: [
                    _buildButton("1", buttonColor: numberColor),
                    _buildButton("2", buttonColor: numberColor),
                    _buildButton("3", buttonColor: numberColor),
                    _buildButton("+", buttonColor: operatorColor),
                  ]),
                  const SizedBox(height: 10),
                  Row(children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: numberColor,
                            shape: const StadiumBorder(),
                            padding: const EdgeInsets.symmetric(vertical: 22.0),
                          ),
                          onPressed: () => _onButtonPressed("0"),
                          child: const Text(
                            "0",
                            style: TextStyle(
                              fontSize: 28.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    _buildButton(".", buttonColor: numberColor),
                    _buildButton("=", buttonColor: operatorColor),
                  ]),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
