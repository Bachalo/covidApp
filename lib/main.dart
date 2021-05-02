//

import 'package:covid_app/stats/pages/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'stats/UI/stats_page.dart';
import 'settings/settings_page_copy.dart';

void main() => runApp(CupertinoApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/': (ctx) => Stats(),
        '/settings': (ctx) => Settings(),
        '/home': (ctx) => HomePage()
      },
    ));
