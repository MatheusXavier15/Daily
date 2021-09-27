import 'package:Daily/screens/home/widgets/ListItem.dart';
import 'package:Daily/screens/widgets/library-box/box.dart';
import 'package:Daily/screens/widgets/library-box/librarybox.dart';
import 'package:flutter/material.dart';

class Library extends StatefulWidget {
  const Library({Key? key}) : super(key: key);

  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  ScrollController controller = ScrollController();
  List<Box> boxes = const [
    Box(icon: 61415, color: Colors.blue, text: 'Concluídos'),
    Box(icon: 61353, color: Colors.red, text: 'Excluídos'),
    Box(icon: 61791, color: Colors.grey, text: 'Arquivados'),
    Box(icon: 62056, color: Colors.lightBlue, text: 'Agendados'),
  ];
  final List<String> listItens = [
    "Ana",
    "Matheus",
    "Pedro",
    "João",
    "Ana",
    "Matheus",
    "Pedro",
    "João",
    "Ana",
    "Matheus",
    "Pedro",
    "João"
  ];
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        SizedBox(width: 300, height: 300, child: LibraryBox(boxes: boxes)),
        SizedBox(
          width: 300,
          height: 320,
          child: ListItem(listItens: listItens, scrollController: controller),
        ),
      ],
    );
  }
}
