import 'package:Daily/screens/home/widgets/library-box/box.dart';
import 'package:flutter/material.dart';

class LibraryBox extends StatefulWidget {
  const LibraryBox({Key? key}) : super(key: key);

  @override
  _LibraryBoxState createState() => _LibraryBoxState();
}

class _LibraryBoxState extends State<LibraryBox> {
  List<Box> boxes = const [
    Box(icon: 61487, color: Colors.blue, text: 'Agendados'),
    Box(icon: 62026, color: Colors.red, text: 'Importantes'),
    Box(icon: 61791, color: Colors.grey, text: 'Arquivados'),
    Box(icon: 62428, color: Colors.amber, text: 'Favoritos'),
  ];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 330,
        child: GridView.count(
          crossAxisSpacing: 40,
          crossAxisCount: 2,
          children: List.generate(
              boxes.length, (index) => Center(child: boxes[index])),
        ),
      ),
    );
  }
}
