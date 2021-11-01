// ignore_for_file: file_names
import 'package:Daily/screens/widgets/library-box/box.dart';
import 'package:Daily/screens/widgets/library-box/librarybox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';
import 'widgets/daymarks.dart';
import 'widgets/listItem.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
  List<Box> boxes = const [
    Box(icon: 61487, color: Colors.blue, text: 'Agendados'),
    Box(icon: 62026, color: Colors.red, text: 'Importantes'),
    Box(icon: 61791, color: Colors.grey, text: 'Arquivados'),
    Box(icon: 62428, color: Colors.amber, text: 'Favoritos'),
  ];
  int extentArrow = 63263;
  double scrollableSize = 150;
  bool dragExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                dragExpanded ? "Segunda-Feira" : "Bem-Vindo",
                style: TextStyle(
                    color: dragExpanded ? deleteTile : highText,
                    fontSize: dragExpanded ? 25 : 20,
                    fontWeight: FontWeight.w700),
              ),
              dragExpanded
                  ? Text(
                      "05/08/2021",
                      style: TextStyle(color: selectedBottomIcon, fontSize: 18),
                    )
                  : Column(
                      children: [
                        Text("Seg",
                            style: TextStyle(
                                color: selectedBottomIcon, fontSize: 18)),
                        Text("05/08",
                            style: TextStyle(color: selectedBottomIcon))
                      ],
                    ),
              SizedBox(
                  width: 300, height: 300, child: LibraryBox(boxes: boxes)),
            ],
          ),
        ),
        NotificationListener<DraggableScrollableNotification>(
          onNotification: (notification) {
            setState(() {
              if (notification.extent < 0.7) {
                scrollableSize = 150;
              } else {
                scrollableSize = 500 * notification.extent;
              }
              extentArrow = notification.extent > 0.6 ? 63264 : 63263;
              dragExpanded = notification.extent > 0.6 ? true : false;
            });
            return true;
          },
          child: DraggableScrollableSheet(
            initialChildSize: 0.52,
            maxChildSize: 0.9,
            minChildSize: 0.52,
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black87,
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: Offset(0, 3))
                  ],
                ),
                child: ListView(
                  children: [
                    Column(
                      children: [
                        Icon(
                          IconData(extentArrow, fontFamily: 'MaterialIcons'),
                          color: selectedBottomIcon,
                          size: 40,
                        ),
                        const Text(
                          "Today",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: selectedBottomIcon,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                    const DayMarks(),
                    LayoutBuilder(builder: (context, constraints) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 10),
                        width: 300,
                        height: scrollableSize,
                        child: Flex(
                          direction: Axis.vertical,
                          children: [
                            Expanded(
                              child: ListItem(
                                listItens: listItens,
                                scrollController: scrollController,
                              ),
                            )
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              );
            },
          ),
        ),
        Container(),
      ],
    );
  }
}
