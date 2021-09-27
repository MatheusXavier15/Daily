import 'package:Daily/screens/home/widgets/listitem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants.dart';

class Notifications extends StatelessWidget {
  Notifications({Key? key}) : super(key: key);
  ScrollController controller = ScrollController();
  final List<String> listItens = [
    "Ana",
    "Matheus",
    "Pedro",
    "João",
    "Ana",
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 45),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Notificações",
                style: TextStyle(
                    color: bottomBarBackground,
                    fontSize: 25,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 90,
                child: Divider(
                  color: bottomBarBackground,
                  thickness: 1,
                ),
              )
            ],
          ),
        ),
        Center(
          child: Stack(
            children: [
              SvgPicture.asset('assets/bubble-notify.svg'),
              SizedBox(
                width: 350,
                height: 500,
                child: ListItem(
                    listItens: listItens, scrollController: controller),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
