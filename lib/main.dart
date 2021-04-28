//

import 'package:flutter/cupertino.dart';
import 'stats/UI/stats_page.dart';
import 'settings/settings_page.dart';

void main() => runApp(CupertinoApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {'/': (ctx) => Stats(), '/settings': (ctx) => Settings()},
    ));
