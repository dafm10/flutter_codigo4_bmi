
import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {

  String textIcon;
  IconData icon;

  IconContent({required this.textIcon, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 56.0,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          textIcon,
          style: TextStyle(fontSize: 22.0),
        )
      ],
    );
  }
}

class ReusableCard extends StatelessWidget {

  Color colorCard;
  Widget childCard;
  Function? myFunction;

  ReusableCard({required this.colorCard, required this.childCard, this.myFunction});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        myFunction!();
      },
      child: Container(
        margin: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: colorCard,
          borderRadius: BorderRadius.circular(14.0),
        ),
        child: childCard,
      ),
    );
  }
}

class InputIcon extends StatelessWidget {

  IconData icon;
  Function onPressed;

  InputIcon({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: Color(0xff4c4f5e),
      shape: CircleBorder(), // poner el boton de forma circular
      child: Icon(icon),
      constraints: BoxConstraints.tightFor(width: 50.0, height: 50.0),
      onPressed: (){
        onPressed();
      },
    );
  }
}


class NavigatorButton extends StatelessWidget {

  String textButton;
  Function onTap;

  NavigatorButton({required this.textButton, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        width: double.infinity,
        color: Color(0xffeb1555),
        margin: EdgeInsets.only(top: 12.0),
        height: 80,
        child: Center(
          child: Text(
            textButton,
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
