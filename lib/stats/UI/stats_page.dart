//

import 'package:covid_app/settings/Services/Services.dart';
import 'package:covid_app/settings/Services/model/cases.dart';
import 'package:covid_app/static/palette.dart';
import 'package:covid_app/stats/UI/components/ActiveCasesChart.dart';
import 'package:covid_app/stats/UI/components/gradientIcon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../settings/Services/model/SharedPreferences.dart';

class Stats extends StatefulWidget {
  final gradients = [Palette.blueColor, Palette.greenierColor];

  @override
  _StatsState createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  String country = "poland";
  List<Cases> _data;
  List<double> _dataD;
  int newCases = 595;
  final Shader myGradient =
      LinearGradient(colors: <Color>[Palette.blueColor, Palette.greenierColor])
          .createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  @override
  void initState() {
    super.initState();
    SharedPrefsSettings().getCurrentSlug().then((value) {
      setState(() {
        country = value;
      });
    });
    Services.getCases(country).then((cases) {
      setState(() {
        _data = cases;
        // Trash code needs clening up
        _dataD = [
          iTD(
            _data[_data.length - 7].active,
          ),
          iTD(
            _data[_data.length - 6].active,
          ),
          iTD(
            _data[_data.length - 5].active,
          ),
          iTD(
            _data[_data.length - 4].active,
          ),
          iTD(
            _data[_data.length - 3].active,
          ),
          iTD(
            _data[_data.length - 2].active,
          ),
          iTD(
            _data[_data.length - 1].active,
          ),
        ];
        newCases =
            _data[_data.length - 1].active - _data[_data.length - 2].active;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    //
    // Size of The screen for scalling purposeos
    var screenSize = MediaQuery.of(context).size;
    //
    return CupertinoPageScaffold(
      backgroundColor: Palette.primaryColor,
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
                      style: TextStyle(
                          fontSize: 30,
                          foreground: Paint()
                            ..shader = myGradient /*color: Palette.blueColor*/),
                    ),
                    Text(
                      "for $country",
                      style: TextStyle(color: Palette.greenierColor),
                    ),
                    Spacer(),
                    //
                    // Update Button
                    CupertinoButton(
                        child: GradientIcon(
                            CupertinoIcons.arrow_2_circlepath,
                            25.0,
                            LinearGradient(
                                colors: widget.gradients,
                                begin: Alignment.bottomLeft,
                                end: Alignment
                                    .topRight)) /*Icon(CupertinoIcons.arrow_2_circlepath)*/,
                        onPressed: () async {
                          await SharedPrefsSettings()
                              .getCurrentSlug()
                              .then((value) {
                            country = value;
                          });
                          Services.getCases(country).then((cases) {
                            setState(() {
                              _data = cases;
                              _dataD = [
                                iTD(
                                  _data[_data.length - 7].active,
                                ),
                                iTD(
                                  _data[_data.length - 6].active,
                                ),
                                iTD(
                                  _data[_data.length - 5].active,
                                ),
                                iTD(
                                  _data[_data.length - 4].active,
                                ),
                                iTD(
                                  _data[_data.length - 3].active,
                                ),
                                iTD(
                                  _data[_data.length - 2].active,
                                ),
                                iTD(
                                  _data[_data.length - 1].active,
                                ),
                              ];
                            });
                          });
                        }),

                    // Settings butt
                    CupertinoButton(
                        child: GradientIcon(
                            CupertinoIcons.settings,
                            25.0,
                            LinearGradient(
                                colors: widget.gradients,
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight)),
                        onPressed: () {
                          Navigator.pushNamed(context, '/settings');
                        }),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [Colors.green, Colors.blue, Colors.orange, Colors.pink],
                stops: [0.2, 0.5, 0.7, 1],
                center: Alignment(0.1, 0.3),
                focal: Alignment(-0.1, 0.6),
                focalRadius: 0.9,
              ),
            ),
            child: Center(
              child: Text(
                newCases.toString(),
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Divider(),
          Container(
            color: CupertinoColors.systemGrey6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Active cases in $country in last 7 days'),
              ],
            ),
          ),
          SizedBox(
              height: 300,
              width: 400,
              child: MyWeeklyActiveChart(widget.gradients, _dataD)),
          // SizedBox(
          //     height: 300, width: 500, child: TimeSeriesBar.withSampleData()),
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
                  color: Palette.primaryColor,
                  child: Column(
                    children: [
                      Text(
                        "Confirmed: ${values.confirmed.toString()}",
                        style: TextStyle(color: Palette.accentColor),
                      ),
                      Text(
                        "Deaths: ${values.deaths.toString()}",
                        style: TextStyle(color: Palette.accentColor),
                      ),
                      Text(
                        "Recovered: ${values.recovered.toString()}",
                        style: TextStyle(color: Palette.accentColor),
                      ),
                      Text(
                        "Active: ${values.active.toString()}",
                        style: TextStyle(color: Palette.accentColor),
                      ),
                      Text(
                        "Date: $date",
                        style: TextStyle(color: Palette.accentColor),
                      ),
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

iTD(int number) {
  var string = number.toString();
  var start = string.substring(0, 1);
  var end = string.substring(1);
  string = start + "." + end;
  var doublee = double.parse(string);
  return doublee;
}
