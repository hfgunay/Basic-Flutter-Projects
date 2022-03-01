import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';

class CalculatorBrain {
  CalculatorBrain({
    required this.weight,
    required this.height,
  });

  final int weight;
  final int height;
  late double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
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
      return 'Exercising helps you lose weight';
    } else if (_bmi > 18) {
      return 'You are fit. Have fun.';
    } else {
      return 'You can go to a dietitian';
    }
  }

  CalculatorBrain copyWith({
    int? weight,
    int? height,
  }) {
    return CalculatorBrain(
      weight: weight ?? this.weight,
      height: height ?? this.height,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'weight': weight,
      'height': height,
    };
  }

  factory CalculatorBrain.fromMap(Map<String, dynamic> map) {
    return CalculatorBrain(
      weight: map['weight']?.toInt() ?? 0,
      height: map['height']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CalculatorBrain.fromJson(String source) => CalculatorBrain.fromMap(json.decode(source));

  @override
  String toString() => 'CalculatorBrain(weight: $weight, height: $height)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CalculatorBrain && other.weight == weight && other.height == height;
  }

  @override
  int get hashCode => weight.hashCode ^ height.hashCode;
}
