import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'screens/home/HomeScreen.dart';
import 'screens/widgets/searchbar.dart';

void main() {
  runApp(const Daily());
}

class Daily extends StatelessWidget {
  const Daily({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (OverscrollIndicatorNotification overscroll) {
        overscroll.disallowGlow();
        return true;
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Daily',
        theme: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          scaffoldBackgroundColor: containerBackground,
          textTheme: Theme.of(context).textTheme.apply(displayColor: listColor),
        ),
        home: const Pages(),
      ),
    );
  }
}

class Pages extends StatefulWidget {
  const Pages({Key? key}) : super(key: key);

  @override
  _PagesState createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  final List<int> icone = [61703, 61790, 0, 61077, 62007];
  final tabs = [
    HomeScreen(),
    Container(
      child: Center(child: Text("Pedro putinha")),
    ),
    Container(),
    Container(
      child: Center(child: Text("Ana putinha")),
    ),
    Container(
      child: Center(child: Text("Maicon putinha")),
    )
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Container(
              alignment: Alignment.centerLeft,
              width: double.infinity,
              child: SearchBar()),
          actions: const [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Icon(
                Icons.account_circle_rounded,
                color: selectedBottomIcon,
                size: 50,
              ),
            )
          ],
        ),
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Increment',
          child: const Icon(
            Icons.add,
            color: bottomBarBackground,
            size: 40,
          ),
          elevation: 2.0,
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          child: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            color: bottomBarBackground,
            elevation: 0,
            child: BottomNavigationBar(
              elevation: 0,
              backgroundColor: const Color(0x00324E6B),
              selectedItemColor: Theme.of(context).colorScheme.onSurface,
              type: BottomNavigationBarType.fixed,
              currentIndex: _selectedIndex,
              iconSize: 30,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              onTap: (index) {
                setState(() {
                  if (index == 2) {
                    return;
                  }
                  _selectedIndex = index;
                });
              },
              items: List.generate(
                icone.length,
                (index) => BottomNavigationBarItem(
                  label: "Label",
                  icon: Icon(
                    IconData(icone[index], fontFamily: 'MaterialIcons'),
                    color: unselectedBottomIcon,
                  ),
                  activeIcon: Icon(
                    IconData(icone[index], fontFamily: 'MaterialIcons'),
                    color: selectedBottomIcon,
                  ),
                ),
              ).toList(),
            ),
          ),
        ),
        body: tabs[_selectedIndex],
      ),
    );
  }
}
