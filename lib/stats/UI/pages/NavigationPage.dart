//

import 'package:covid_app/settings/settings_page.dart';
import 'package:covid_app/theme/palette.dart';
import 'package:covid_app/stats/UI/stats_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'AlarmPage.dart';

class NavigationPage extends StatefulWidget {
  final _pages = <Widget>[
    Stats(),
    AlarmPage(),
    Settings(),
  ];

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
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
