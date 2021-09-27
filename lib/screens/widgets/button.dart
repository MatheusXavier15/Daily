import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button(
      {Key? key,
      required this.buttonText,
      this.buttonColor = const Color(0xFF01579B),
      this.textColor = Colors.white,
      required this.buttonSize,
      required this.press})
      : super(key: key);
  final String buttonText;
  final Color buttonColor;
  final Color textColor;
  final double buttonSize;
  final Function() press;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: SizedBox(
        width: buttonSize,
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Container(
                color: buttonColor,
              ),
            ),
            Center(
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  primary: Colors.white,
                  textStyle: TextStyle(fontSize: 15, color: textColor),
                ),
                onPressed: press,
                child: Text(buttonText,
                    style: TextStyle(fontSize: 15, color: textColor)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
