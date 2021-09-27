import 'package:flutter/material.dart';

import 'textfield.dart';

class RoundedInputField extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final Color iconColor;
  bool inputPassword;
  final ValueChanged<String> onChanged;
  RoundedInputField({
    Key? key,
    required this.hintText,
    required this.onChanged,
    this.icon = Icons.person,
    this.iconColor = Colors.white,
    this.inputPassword = false,
  }) : super(key: key);

  @override
  State<RoundedInputField> createState() => _RoundedInputFieldState();
}

class _RoundedInputFieldState extends State<RoundedInputField> {
  late bool inputObscure;
  @override
  void initState() {
    super.initState();
    inputObscure = widget.inputPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: inputObscure,
        onChanged: widget.onChanged,
        cursorColor: Colors.lightBlue,
        decoration: InputDecoration(
          icon: Icon(
            widget.icon,
            color: widget.iconColor,
          ),
          hintText: widget.hintText,
          border: InputBorder.none,
          suffixIcon: widget.inputPassword
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      inputObscure = !inputObscure;
                    });
                  },
                  icon: inputObscure
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off),
                  color: widget.iconColor,
                )
              : const Icon(IconData(0, fontFamily: 'MaterialIcons'),
                  color: Colors.transparent),
        ),
      ),
    );
  }
}
