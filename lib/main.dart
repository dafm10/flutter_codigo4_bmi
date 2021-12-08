import 'package:flutter/material.dart';
import 'package:flutter_codigo4_bmi/pages/input_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // para quitar la barra DEBUG en la esquina superior izquierda
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xff0a0e21),

        // centralizamos el diseño de lss slider con sliderTheme en el main
        sliderTheme: SliderThemeData(
          activeTrackColor: Colors.white, // barra
          thumbColor: const Color(0xffeb1555), // punto
          thumbShape: const RoundSliderThumbShape( // tamaño del punto
            enabledThumbRadius: 18.0,
          ),
          overlayColor: const Color(0xffeb1555).withOpacity(0.4),
          overlayShape: const RoundSliderOverlayShape(
            overlayRadius: 30.0,
          ),
        ),

        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff0a0e21),
        ),
      ),
      home: InputPage(),
    );
  }
}
