// ignore_for_file: file_names

import 'package:daily/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
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
    var screenSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        DraggableScrollableSheet(
          initialChildSize: 0.5,
          maxChildSize: 0.8,
          minChildSize: 0.5,
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
                    children: const [
                      Icon(
                        Icons.expand_less_outlined,
                        color: selectedBottomIcon,
                        size: 40,
                      ),
                      Text(
                        "Today",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: selectedBottomIcon,
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
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
                  ),
                  Expanded(
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: listItens.length,
                      itemBuilder: (context, index) {
                        final item = listItens[index];
                        return Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Dismissible(
                              background: Container(
                                decoration: const BoxDecoration(
                                    color: selectedBottomIcon),
                                width: screenSize.width * 0.9,
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.done_outlined,
                                    size: 30,
                                    color: deleteTile,
                                  ),
                                ),
                                alignment: Alignment.centerLeft,
                              ),
                              secondaryBackground: Container(
                                decoration:
                                    const BoxDecoration(color: deleteTile),
                                width: screenSize.width * 0.9,
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.delete_outline_outlined,
                                    size: 30,
                                    color: selectedBottomIcon,
                                  ),
                                ),
                                alignment: Alignment.centerRight,
                              ),
                              onDismissed: (direction) {},
                              key: Key(item),
                              child: Container(
                                decoration:
                                    const BoxDecoration(color: listColor),
                                width: screenSize.width * 1,
                                height: 50,
                                child: ListTile(
                                  title: Text(
                                    listItens[index],
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        Container(),
      ],
    );
  }
}
