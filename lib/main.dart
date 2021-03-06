import 'package:Daily/screens/Library/library.dart';
import 'package:Daily/screens/charts/charts.dart';
import 'package:Daily/screens/notifications/notifications.dart';
import 'package:Daily/screens/welcome/welcome_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'screens/home/HomeScreen.dart';
import 'screens/widgets/searchbar.dart';
import 'services/db_sqlite.dart';

void main() {
  createDatabase();
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
        home: const WelcomeScreen(),
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
    Library(),
    Container(),
    Charts(),
    Notifications()
  ];
  int _selectedIndex = 0;
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 100,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Container(
              alignment: Alignment.centerLeft,
              width: double.infinity,
              child: SearchBar()),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 25.0),
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
          onPressed: () {
            print('pressed');
            setState(() {
              _counter++;
            });
            insertTaskPerDay(TaskPerDay(
              id: _counter,
              day: '15',
              description: 'Outra tarefa de teste',
            ));
          },
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
