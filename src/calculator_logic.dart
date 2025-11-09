
class CalculatorLogic {
  String _output = "0";
  double _num1 = 0;
  double _num2 = 0;
  String _operand = "";

  String processButton(String buttonText) {
    if ("+-/*".contains(buttonText)) {
      _num1 = double.parse(_output);
      _operand = buttonText;
      _output = "0";
    } else if (buttonText == ".") {
      if (!_output.contains(".")) {
        _output += buttonText;
      }
    } else if (buttonText == "C") {
      _output = "0";
      _num1 = 0;
      _num2 = 0;
      _operand = "";
    } else if (buttonText == "+/-") {
      if (_output != "0") {
        if (_output.startsWith('-')) {
          _output = _output.substring(1);
        } else {
          _output = "-$_output";
        }
      }
    } else if (buttonText == "%") {
      _output = (double.parse(_output) / 100).toString();
    }
    else if (buttonText == "=") {
      if (_operand.isNotEmpty) {
        _num2 = double.parse(_output);
        if (_operand == "+") {
          _output = (_num1 + _num2).toString();
        } else if (_operand == "-") {
          _output = (_num1 - _num2).toString();
        } else if (_operand == "*") {
          _output = (_num1 * _num2).toString();
        } else if (_operand == "/") {
          if (_num2 == 0) {
            _output = "Error";
          } else {
            _output = (_num1 / _num2).toString();
          }
        }
        _num1 = 0;
        _num2 = 0;
        _operand = "";
      }
    } else {
      if (_output == "0") {
        _output = buttonText;
      } else {
        _output += buttonText;
      }
    }

    if (_output != "Error" && _output.contains('.')) {
      var temp = double.parse(_output);
      if (temp == temp.truncate()) {
        _output = temp.truncate().toString();
      }
    }

    return _output;
  }
}
