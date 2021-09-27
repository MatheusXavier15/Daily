import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: -40,
            left: -160,
            child: SvgPicture.asset(
              "assets/bubble-login.svg",
              width: size.width * 0.6,
            ),
          ),
          Positioned(
            top: -40,
            right: -120,
            child: SvgPicture.asset(
              "assets/bubble-login.svg",
              width: size.width * 0.5,
            ),
          ),
          Positioned(
            bottom: 150,
            right: -140,
            child: SvgPicture.asset(
              "assets/bubble-login.svg",
              width: size.width * 0.6,
            ),
          ),
          Positioned(
            bottom: -100,
            left: -20,
            child: SvgPicture.asset(
              "assets/bubble-login.svg",
              width: size.width * 0.6,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
