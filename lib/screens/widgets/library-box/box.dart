import 'package:flutter/material.dart';

class Box extends StatelessWidget {
  const Box(
      {Key? key, required this.icon, required this.text, required this.color})
      : super(key: key);
  final int icon;
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            spreadRadius: 1.0,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Text(text),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 15),
            child: Container(
              alignment: Alignment.bottomLeft,
              child: Icon(
                IconData(icon, fontFamily: 'MaterialIcons'),
                color: color,
                size: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
