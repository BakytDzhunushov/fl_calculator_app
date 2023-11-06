import 'package:flutter/material.dart';
//part 'main.dart';
part 'calc_button.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _output = '0';
  String _input = '';
  double _result = 0;
  String _operator = '';
  bool _isOperatorPressed = false;

  void _onDigitPress(String digit) {
    setState(() {
      if (_isOperatorPressed) {
        _input = '';
        _isOperatorPressed = false;
      }
      if (digit == '.' && _input.contains('.')) {
        return;
      }
      if (digit == '0' && _input == '0') {
        return;
      }
      _input += digit;
      _output = _input;
    });
  }

  void _onOperatorPress(String operator) {
    setState(() {
      if (_isOperatorPressed) {
        _operator = operator;
      } else {
        if (_operator.isNotEmpty) {
          _calculate();
          _operator = operator;
          _input = '$_result';
          _output = _input;
        } else {
          _operator = operator;
          _result = double.parse(_input);
          _isOperatorPressed = true;
        }
      }
    });
  }

  void _onClearPress() {
    setState(() {
      _output = '0';
      _input = '';
      _result = 0;
      _operator = '';
      _isOperatorPressed = false;
    });
  }

  void _onCalculatePress() {
    setState(() {
      _calculate();
      _operator = '';
      _isOperatorPressed = true;
    });
  }

  void _calculate() {
    if (_operator == '+') {
      _result += double.parse(_input);
    } else if (_operator == '-') {
      _result -= double.parse(_input);
    } else if (_operator == '×') {
      _result *= double.parse(_input);
    } else if (_operator == '÷') {
      if (double.parse(_input) != 0) {
        _result /= double.parse(_input);
      } else {
        _output = 'Ошибка';
        return;
      }
    }
    _input = '$_result';
    _output = _input;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        centerTitle: true,
        title: const Text(
          'Калькулятор',
          style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.centerRight,
            child: Text(
              _output,
              style: const TextStyle(fontSize: 48),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalculatorButton('7', _onDigitPress),
              CalculatorButton('8', _onDigitPress),
              CalculatorButton('9', _onDigitPress),
              CalculatorButton('÷', _onOperatorPress),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalculatorButton('4', _onDigitPress),
              CalculatorButton('5', _onDigitPress),
              CalculatorButton('6', _onDigitPress),
              CalculatorButton('×', _onOperatorPress),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalculatorButton('1', _onDigitPress),
              CalculatorButton('2', _onDigitPress),
              CalculatorButton('3', _onDigitPress),
              CalculatorButton('-', _onOperatorPress),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalculatorButton('0', _onDigitPress),
              CalculatorButton('.', _onDigitPress),
              CalculatorButton('C', (val) {
                _onClearPress();
              }),
              CalculatorButton('+', _onOperatorPress),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('Произведено в КР', style: TextStyle(
                fontSize: 36, fontWeight: FontWeight.bold),),
              CalculatorButton('=', (val) {
                _onCalculatePress();
              }),
            ],
          ),
        ],
      ),
    );
  }
}