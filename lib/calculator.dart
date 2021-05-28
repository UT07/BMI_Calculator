import 'dart:math';

class Calculator {
  final double height;
  final int weight;
  double _bmi = 0;
  Calculator(this.height, this.weight);
  String calculate() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'OVERWEIGHT';
    } else if (_bmi > 18.5) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String getInterpretation() {
    String result = getResult();
    if (result.compareTo('OVERWEIGHT') == 0) {
      return 'You have higher than normal body weight. Try to exercise more.';
    } else if (result.compareTo('NORMAL') == 0) {
      return 'You have a normal bod weight. Good job!';
    } else {
      return 'You have a lower than normal bofy weight. You should try ot gain weight.';
    }
  }
}
