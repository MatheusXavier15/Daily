// ignore_for_file: file_names
import 'package:flutter/material.dart';
import '../../../constants.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    Key? key,
    required this.listItens,
    required this.scrollController,
  }) : super(key: key);

  final List<String> listItens;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                /*
                @background: Responsável pelo swipe esquerdo do listTile
                */
                background: Container(
                  decoration: const BoxDecoration(color: selectedBottomIcon),
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
                /*
                @secondaryBackground: Responsável pelo swipe direito do listTile
                */
                secondaryBackground: Container(
                  decoration: const BoxDecoration(color: deleteTile),
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
                /*
                @onDismissed: Function que executa uma ação ao executar um dismiss.
                @Params: direction - Direção que o swipe foi realizado
                */
                onDismissed: (direction) {},
                /*
                @key: Alvo do dismiss
                */
                key: Key(item),
                child: Container(
                  decoration: const BoxDecoration(color: listColor),
                  height: 50,
                  child: ListTile(
                    title: Text(
                      listItens[index],
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
