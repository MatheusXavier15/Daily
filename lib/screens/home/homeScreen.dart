// ignore_for_file: file_names
import 'package:Daily/screens/home/widgets/library-box/librarybox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import 'widgets/day-marks.dart';
import 'widgets/list-item.dart';

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
  int extentArrow = 63263;
  double scrollableSize = 150;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const LibraryBox(),
        NotificationListener<DraggableScrollableNotification>(
          onNotification: (notification) {
            setState(() {
              if (notification.extent < 0.7) {
                scrollableSize = 150;
              } else {
                scrollableSize = 500 * notification.extent;
              }
              extentArrow = notification.extent > 0.6 ? 63264 : 63263;
            });
            return true;
          },
          child: DraggableScrollableSheet(
            initialChildSize: 0.55,
            maxChildSize: 0.8,
            minChildSize: 0.55,
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
                child: Column(
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
                            ListItem(
                              listItens: listItens,
                              scrollController: scrollController,
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
