//

import 'package:covid_app/theme/fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'stats/UI/pages/NavigationPage.dart';
import 'stats/UI/stats_page.dart';
import 'settings/settings_page_copy.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(fontFamily: Fonts.sf_regular),
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/': (ctx) => Stats(),
        '/settings': (ctx) => Settings(),
        '/home': (ctx) => NavigationPage()
      },
    ));
