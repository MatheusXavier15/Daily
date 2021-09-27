import 'package:flutter/material.dart';

import 'box.dart';

class LibraryBox extends StatefulWidget {
  const LibraryBox({Key? key, required this.boxes}) : super(key: key);
  final List<Box> boxes;
  @override
  _LibraryBoxState createState() => _LibraryBoxState();
}

class _LibraryBoxState extends State<LibraryBox> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        child: GridView.count(
          crossAxisSpacing: 40,
          crossAxisCount: 2,
          children: List.generate(widget.boxes.length,
              (index) => Center(child: widget.boxes[index])),
        ),
      ),
    );
  }
}
