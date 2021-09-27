import 'package:Daily/screens/login/login_screen.dart';
import 'package:Daily/screens/widgets/button.dart';
import 'package:flutter/material.dart';

class WelcomeBody extends StatelessWidget {
  const WelcomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;
    return SizedBox(
      height: screensize.height,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Bem-Vindo ao Daily",
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
          Button(
            buttonText: "Entrar",
            buttonSize: screensize.width * 0.8,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
                  },
                ),
              );
            },
          ),
          const SizedBox(
            height: 15,
          ),
          Button(
            buttonText: "Cadastrar",
            buttonSize: screensize.width * 0.8,
            press: () {},
          )
        ],
      ),
    );
  }
}
