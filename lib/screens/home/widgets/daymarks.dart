// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../../../constants.dart';

class DayMarks extends StatelessWidget {
  const DayMarks({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Text(
            "Manhã",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: deleteTile,
              fontSize: 20,
            ),
          ),
          Text(
            "Tarde",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: deleteTile,
              fontSize: 20,
            ),
          ),
          Text(
            "Noite",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: deleteTile,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
