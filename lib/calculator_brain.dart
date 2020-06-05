class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});
  final int height;
  final int weight;

  double _bmi;

  String getBMI() {
    var h = height / 100;
    _bmi = weight / (h * h);
    return (_bmi.toStringAsFixed(1));
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have an higher than normal body weight';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight';
    } else {
      return 'You have a lower than normal body weight';
    }
  }
}
