import 'package:flutter/material.dart';
import 'package:flutter_codigo4_bmi/bmi_brain.dart';
import 'package:flutter_codigo4_bmi/pages/result_page.dart';
import 'package:flutter_codigo4_bmi/pages/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const activeCardColor = Color(0xff1d1e33);
const tabSelectedColor = Color(0xff101526);
// enum es un tipo especial de clase utilizado para expresar
// un número ilimitado de constantes
enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 150;
  int weight = 70;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    // si selectedGender es = a Gender.male entonces
                    // colocar el color de tabSelectedColor, si no, activeCardColor
                    colorCard: selectedGender == Gender.male
                        ? tabSelectedColor
                        : activeCardColor,
                    childCard: IconContent(
                      textIcon: 'MALE',
                      icon: FontAwesomeIcons.mars,
                    ),
                    myFunction: () {
                      selectedGender = Gender.male;
                      setState(() {});
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colorCard: selectedGender == Gender.female
                        ? tabSelectedColor
                        : activeCardColor,
                    childCard: IconContent(
                      textIcon: 'FEMALE',
                      icon: FontAwesomeIcons.venus,
                    ),
                    myFunction: () {
                      selectedGender = Gender.female;
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colorCard: activeCardColor,
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'HEIGHT',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white60,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // para alinear CM con el numero
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toString(), // convertimos a texto
                              style: const TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              'cm',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white60,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Slider(
                          // convertimos height a double por que
                          // value es tipo DOUBLE
                          value: height.toDouble(),
                          min: 50.0,
                          max: 250.0,
                          onChanged: (double altura) {
                            // .round() por que height se declaró como entero
                            height = altura.round();
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colorCard: activeCardColor,
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'WEIGHT',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white60,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          weight.toString(),
                          style: const TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InputIcon(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                weight--;
                                setState(() {});
                              },
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            InputIcon(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                weight++;
                                setState(() {});
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colorCard: activeCardColor,
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'AGE',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white60,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          age.toString(),
                          style: const TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InputIcon(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                age--;
                                setState(() {});
                              },
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            InputIcon(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                age++;
                                setState(() {});
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // envolvemos Container en el boton para interactuar
          NavigatorButton(
            textButton: 'CALCULATE',
            onTap: (){
              BMIBrain bmi = BMIBrain(height: height, weight: weight);
              String bmiCalculate = bmi.calculateBMI();
              String bmiResult = bmi.getResultText();
              String bmiTips = bmi.getTip();

              // para ir a la página ResultPage
              // el 1er context es de: Widget build(BuildContext context)
              // MaterialPageRoute: gestiona las rutas de las páginas de Material
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiCalculate: bmiCalculate,
                    bmiResult: bmiResult,
                    bmiTips: bmiTips,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
