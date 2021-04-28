//

import 'package:covid_app/static/palette.dart';
import 'package:covid_app/stats/UI/components/TitleData.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyWeeklyActiveChart extends StatefulWidget {
  final List<Color> gradientColors;
  final List<double> data;

  MyWeeklyActiveChart(this.gradientColors, this.data);
  @override
  _MyWeeklyActiveChartState createState() => _MyWeeklyActiveChartState();
}

class _MyWeeklyActiveChartState extends State<MyWeeklyActiveChart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Palette.primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: LineChart(
          LineChartData(
              minX: 1,
              maxX: 7,
              maxY: 5,
              minY: 0,
              titlesData: LineTitles.getTitleData(),
              gridData: FlGridData(
                show: true,
                getDrawingHorizontalLine: (value) {
                  return FlLine(color: Colors.grey[700], strokeWidth: 0.5);
                },
              ),
              borderData: FlBorderData(
                  show: true, border: Border.all(color: Colors.grey[700])),
              lineBarsData: [
                LineChartBarData(
                    spots: [
                      FlSpot(1, widget.data[0]),
                      FlSpot(2, widget.data[1]),
                      FlSpot(3, widget.data[2]),
                      FlSpot(4, widget.data[3]),
                      FlSpot(5, widget.data[4]),
                      FlSpot(6, widget.data[5]),
                      FlSpot(7, widget.data[6]),
                    ],
                    isCurved: true,
                    // dotData: FlDotData(show: false),
                    colors: widget.gradientColors,
                    barWidth: 3,
                    belowBarData: BarAreaData(
                        show: true,
                        colors: widget.gradientColors
                            .map((color) => color.withOpacity(0.5))
                            .toList())),
              ]),
          swapAnimationCurve: Curves.linear,
          swapAnimationDuration: Duration(milliseconds: 150),
        ),
      ),
    );
  }
}
