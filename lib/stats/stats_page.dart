//

import 'package:covid_app/settings/Services/Services.dart';
import 'package:covid_app/settings/Services/model/cases.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Stats extends StatefulWidget {
  @override
  _StatsState createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  List<Cases> _data;

  @override
  void initState() {
    super.initState();
    Services.getCases('poland').then((cases) {
      setState(() {
        _data = cases;
      });
    });
  }

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
                        child: Icon(CupertinoIcons.arrow_2_circlepath),
                        onPressed: () {
                          Services.getCases('poland').then((cases) {
                            setState(() {
                              _data = cases;
                            });
                          });
                        }),
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
          ),
          Expanded(
            child: ListView.builder(
              itemCount: null == _data ? 0 : _data.length,
              itemBuilder: (context, index) {
                Cases values = _data.reversed.toList()[index];
                var date = values.date.toString();
                date = date.substring(0, 10);
                return Card(
                  child: Column(
                    children: [
                      Text("Confirmed: ${values.confirmed.toString()}"),
                      Text("Deaths: ${values.deaths.toString()}"),
                      Text("Recovered: ${values.recovered.toString()}"),
                      Text("Active: ${values.active.toString()}"),
                      Text("Date: $date"),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
