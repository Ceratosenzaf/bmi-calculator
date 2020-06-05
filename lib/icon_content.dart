import 'package:flutter/material.dart';
import 'constants.dart';

enum Operator { plus, minus }

class IconGenderCard extends StatelessWidget {
  IconGenderCard(this.gender, this.icon);

  final String gender;
  final icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          gender,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.operator, @required this.onPress});

  final Operator operator;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      shape: CircleBorder(),
      elevation: 6.0,
      fillColor: Colors.white30,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      child: Icon(operator == Operator.plus ? Icons.add : Icons.remove),
    );
  }
}
