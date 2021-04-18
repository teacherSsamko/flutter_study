import 'package:flutter/cupertino.dart';
import 'dart:math';

class CalculateBrain {
  CalculateBrain({@required this.height, @required this.weight});

  final int height;
  final int weight;
  double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25.0) {
      return '과체중';
    } else if (_bmi >= 18.5) {
      return '정상';
    } else {
      return '체중미달';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25.0) {
      return '정상 체중보다 많이 나갑니다.\n식단조절과 운동이 필요합니다.';
    } else if (_bmi >= 18.5) {
      return '아주 좋아요! 꾸준히 운동하세요!';
    } else {
      return '정상 체중보다 적게 나갑니다.\n좀 더 먹어야 합니다.';
    }
  }
}
