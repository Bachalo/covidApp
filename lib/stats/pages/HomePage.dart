//

import 'package:covid_app/static/palette.dart';
import 'package:covid_app/stats/UI/stats_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'FourthPage.dart';
import '../../settings/settings_page.dart';

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return CupertinoTabScaffold(
//         tabBar: CupertinoTabBar(
//             backgroundColor: Palette.primaryColor,
//             activeColor: Palette.blueColor,
//             items: [
//               BottomNavigationBarItem(
//                   icon: Icon(CupertinoIcons.graph_circle),
//                   title: Text("Stats")),
//               BottomNavigationBarItem(
//                   icon: Icon(CupertinoIcons.settings), title: Text("Settings"))
//             ]),
//         tabBuilder: (context, index) {
//           switch (index) {
//             case 0:
//               return SingleChildScrollView(child: Stats());
//               break;
//             case 1:
//               return Settings();
//               break;
//             default:
//               return FourthPage();
//               break;
//           }
//         });
//   }
// }

class HomePage extends StatefulWidget {
  final _pages = <Widget>[
    Stats(),
    FourthPage(),
    Settings(),
  ];

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.primaryColor,
      bottomNavigationBar: CurvedNavigationBar(
        height: 50,
        buttonBackgroundColor: Palette.greenierColor,
        backgroundColor: Palette.primaryColor,
        color: Palette.accentColor2,
        animationDuration: Duration(milliseconds: 300),
        animationCurve: Curves.easeInOut,
        items: <Widget>[
          Icon(CupertinoIcons.graph_circle,
              size: 30, color: checkIndex(0, _index)),
          Icon(
            CupertinoIcons.profile_circled,
            size: 30,
            color: checkIndex(1, _index),
          ),
          Icon(
            CupertinoIcons.settings,
            size: 30,
            color: checkIndex(2, _index),
          ),
        ],
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
      ),
      body: widget._pages[_index],
    );
  }
}

checkIndex(int index, int index2) {
  if (index == index2) {
    return CupertinoColors.black;
  } else {
    return CupertinoColors.inactiveGray;
  }
}
