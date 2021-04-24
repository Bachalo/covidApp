//

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Stats extends StatefulWidget {
  var notificationsEnabled = false;

  @override
  _StatsState createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Column(
        children: [
          Container(
            height: 150,
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'Covid Stats',
                      style:
                          TextStyle(fontSize: 30, color: CupertinoColors.black),
                    ),
                    Spacer(),
                    CupertinoButton(
                        child: Icon(CupertinoIcons.settings),
                        onPressed: () {
                          Navigator.pushNamed(context, '/settings');
                        }),
                  ],
                ),
              ),
            ),
          ),
          Divider(),
          Container(
            color: CupertinoColors.systemGrey6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Country stats'),
              ],
            ),
          ),
          Divider(),
          Container(
            color: CupertinoColors.systemGrey6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Notifications'),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// class Stats extends StatefulWidget {
//   @override
//   _StatsState createState() => _StatsState();
// }

// class _StatsState extends State<Stats> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Co-track'),
//         actions: [
//           IconButton(
//               icon: Icon(Icons.settings),
//               onPressed: () {
//                 Navigator.pushNamed(context, '/settings');
//               })
//         ],
//       ),
//       body: Column(
//         children: [
//           Text('Stats for country_name'),
//           Text('New cases: '),
//           Text('New deaths: '),
//           Text('Recoveries')
//         ],
//       ),
//     );
//   }
// }
