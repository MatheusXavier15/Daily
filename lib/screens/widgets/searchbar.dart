import 'package:Daily/constants.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar>
    with SingleTickerProviderStateMixin {
  bool toggle = false;
  late AnimationController _con;
  late TextEditingController _textEditingController;
  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _con = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 375),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffF2F3F7),
      child: Center(
        child: Container(
          height: 100.0,
          width: 250.0,
          alignment: const Alignment(-1.0, 0.0),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 375),
            height: 48.0,
            width: !toggle ? 48.0 : 250.0,
            curve: Curves.easeOut,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  spreadRadius: -10.0,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 10.0),
                ),
              ],
            ),
            child: Stack(
              children: [
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 375),
                  top: 6.0,
                  right: 7.0,
                  curve: Curves.easeOut,
                  child: AnimatedOpacity(
                    opacity: 1.0,
                    duration: const Duration(milliseconds: 200),
                    child: Container(
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: AnimatedBuilder(
                        child: const Icon(
                          Icons.search,
                          size: 25.0,
                          color: search,
                        ),
                        builder: (context, widget) {
                          return Transform.rotate(
                            angle: _con.value * 2.0 * pi,
                            child: widget,
                          );
                        },
                        animation: _con,
                      ),
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 375),
                  left: !toggle ? 20.0 : 40.0,
                  curve: Curves.easeOut,
                  top: 11.0,
                  child: AnimatedOpacity(
                    opacity: !toggle ? 0.0 : 1.0,
                    duration: const Duration(milliseconds: 200),
                    child: SizedBox(
                      height: 23.0,
                      width: 180.0,
                      child: TextField(
                        controller: _textEditingController,
                        cursorRadius: const Radius.circular(10.0),
                        cursorWidth: 2.0,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          labelText: 'Pesquisar...',
                          labelStyle: const TextStyle(
                            color: weekSelect,
                            fontSize: 17.0,
                            fontWeight: FontWeight.w500,
                          ),
                          alignLabelWithHint: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(30.0),
                  child: IconButton(
                    splashRadius: 19.0,
                    icon: !toggle
                        ? Container()
                        : const Icon(
                            Icons.close,
                            color: Colors.red,
                          ),
                    onPressed: () {
                      setState(
                        () {
                          if (!toggle) {
                            toggle = true;
                            _con.forward();
                          } else {
                            toggle = false;
                            FocusManager.instance.primaryFocus?.unfocus();
                            _textEditingController.clear();
                            _con.reverse();
                          }
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
