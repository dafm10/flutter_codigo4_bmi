import 'package:flutter/material.dart';
import 'package:flutter_codigo4_bmi/pages/input_page.dart';
import 'package:flutter_codigo4_bmi/pages/widgets.dart';

class ResultPage extends StatelessWidget {
  String bmiCalculate;
  String bmiResult;
  String bmiTips;

  ResultPage({required this.bmiCalculate, required this.bmiResult, required this.bmiTips});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result Page'),
      ),
      body: Column(
        children: [
          Text(
            'Results',
            style: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: ReusableCard(
              colorCard: activeCardColor,
              childCard: Column(
                // rossAxisAlignment.stretch para ocupar el ancho total
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    bmiResult,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.greenAccent,
                    ),
                  ),
                  Text(
                    bmiCalculate,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 70.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    bmiTips,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          NavigatorButton(
            textButton: 'RE-CALCULATE',
            onTap: (){
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}