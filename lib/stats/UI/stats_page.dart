//

import 'package:covid_app/settings/Services/Services.dart';
import 'package:covid_app/settings/Services/model/cases.dart';
import 'package:covid_app/theme/palette.dart';
import 'package:covid_app/stats/UI/components/ActiveCasesChart.dart';
import 'package:covid_app/theme/fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../settings/Services/model/SharedPreferences.dart';

class Stats extends StatefulWidget {
  final gradients = [Palette.blueColor, Palette.greenierColor];

  @override
  _StatsState createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  Future _getData() async {
    await SharedPrefsSettings().getCurrentSlug().then((value) {
      country = value;
    });
    await Services.getCases(country).then((cases) {
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
        newCases = _data[_data.length - 2].confirmed -
            _data[_data.length - 3].confirmed;
        newRecoveries = _data[_data.length - 2].recovered -
            _data[_data.length - 3].recovered;
      });
    });
  }

  String country = "poland";
  List<Cases> _data;
  List<double> _dataD;
  int newCases = null;
  int newRecoveries = null;
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
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    //var screenSize = MediaQuery.of(context).size;
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Palette.primaryColor,
      child: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            CupertinoSliverNavigationBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.black.withOpacity(0.4),
              largeTitle: Text(
                "Covid stats for $country",
                style: TextStyle(
                    foreground: Paint()
                      ..shader = myGradient /*color: Palette.blueColor*/),
              ),
            ),
          ];
        },
        body: Flex(direction: Axis.vertical, children: [
          ClipRect(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                // Zakażenia and wyzdrowienia widget
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xffa71d31), Color(0xff3f0d12)],
                          )),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Zakażenia",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: Fonts.sf_regular),
                            ),
                            check(
                              newCases,
                              null,
                              new SpinKitFadingCircle(
                                color: Colors.white,
                                size: 45,
                              ),
                              Text(newCases.toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: scaleFontSize(newCases),
                                      fontFamily: Fonts.sf_regular)),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xff0bab64), Color(0xff3bb78f)],
                          )),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Wyzdrowienia",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            check(
                              newCases,
                              null,
                              new SpinKitFadingCircle(
                                color: Colors.white,
                                size: 45,
                              ),
                              Text(newRecoveries.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: scaleFontSize(newRecoveries),
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: widget.gradients),
                    borderRadius: BorderRadius.circular(30),
                    color: CupertinoColors.systemGrey6,
                  ),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 30.0),
                      child: Text(
                        'Aktywne przypadki w $country',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: Fonts.sf_regular,
                        ),
                      )),
                ),
                SizedBox(
                    height: 300,
                    width: 400,
                    child: MyWeeklyActiveChart(widget.gradients, _dataD)),
              ],
            ),
          ),
        ]),
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

scaleFontSize(int number) {
  var length = number.toString().length;
  print(length);
  if (length < 4) {
    var size = 270 / (length * 4);
    return size;
  } else {
    var size = 210 / length;
    return size;
  }
}

check(value, value2, Widget widget1, Widget widget2) {
  if (value == value2) {
    return widget1;
  } else {
    return widget2;
  }
}
