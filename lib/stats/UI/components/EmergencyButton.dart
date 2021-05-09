//

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmergencyButton extends StatelessWidget {
  EmergencyButton(
      {this.screenSize,
      this.text,
      this.icon,
      this.onPressed,
      this.buttonColor,
      this.textIconColor});
  final Size screenSize;
  final String text;
  final IconData icon;
  final Function onPressed;
  final Color buttonColor;
  final Color textIconColor;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        child: Container(
          height: 50,
          width: screenSize.width * 0.41,
          decoration: BoxDecoration(
              color: buttonColor, borderRadius: BorderRadius.circular(30.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: textIconColor,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                text,
                style: TextStyle(color: textIconColor),
              )
            ],
          ),
        ),
        onPressed: onPressed);
  }
}
