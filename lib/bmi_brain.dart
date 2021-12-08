

import 'dart:math';

class BMIBrain{

  int height;
  int weight;
  double bmi = 0;

  BMIBrain({required this.height, required this.weight});

  String calculateBMI () {
    // la formula es peso entre altura en metros al cuadrado
    bmi = weight / pow(height/100, 2);
    // convertimos bmi en String
    return bmi.toStringAsFixed(1);
  }

  String getResultText(){
    if (bmi > 30) {
      return 'Obesity';
    }else if(bmi > 25) {
      return 'Overweight';
    }else if(bmi > 18.5){
      return 'Normal';
    }else{
      return 'Underweight';
    }
  }

  String getTip(){
    if (bmi > 30) {
      return 'you must diet';
    }else if(bmi > 25) {
      return 'you must exercise';
    }else if(bmi > 18.5){
      return 'you are at the right weight, good job';
    }else{
      return 'you must eat more';
    }
  }

}