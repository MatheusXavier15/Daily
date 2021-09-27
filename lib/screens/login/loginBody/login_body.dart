import 'package:Daily/main.dart';
import 'package:Daily/screens/widgets/button.dart';
import 'package:Daily/screens/widgets/inputfield.dart';
import 'package:Daily/screens/widgets/socialIcon/social_icon.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'background.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: screensize.height,
      child: Background(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Bem-Vindo de Volta",
                style: TextStyle(
                    color: deleteTile,
                    fontSize: 15,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 25,
              ),
              RoundedInputField(
                hintText: "Seu Email",
                icon: Icons.email_outlined,
                iconColor: Colors.lightBlue,
                onChanged: (value) {},
              ),
              RoundedInputField(
                hintText: "Sua Senha",
                icon: Icons.lock,
                iconColor: Colors.lightBlue,
                onChanged: (value) {},
                inputPassword: true,
              ),
              const SizedBox(
                height: 30,
              ),
              Button(
                buttonText: 'Entrar',
                buttonColor: Colors.lightBlue.shade800,
                buttonSize: screensize.width * 0.3,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const Pages();
                      },
                    ),
                  );
                },
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30.0, bottom: 15),
                child: Text(
                  "Ou entre através de",
                  style: TextStyle(
                      color: deleteTile,
                      fontSize: 15,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SocalIcon(
                    iconSrc: "assets/facebook.svg",
                    press: () {},
                  ),
                  SocalIcon(
                    iconSrc: "assets/apple.svg",
                    press: () {},
                  ),
                  SocalIcon(
                    iconSrc: "assets/google-plus.svg",
                    press: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
