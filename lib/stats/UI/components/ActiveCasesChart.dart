//

import 'package:covid_app/theme/palette.dart';
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
                    spots: checkForNull(widget.data),
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

checkForNull(List<double> data) {
  if (data == null) {
    return [
      FlSpot(1, 0.1),
      FlSpot(2, 0.1),
      FlSpot(3, 0.1),
      FlSpot(4, 0.1),
      FlSpot(5, 0.1),
      FlSpot(6, 0.1),
      FlSpot(7, 0.1)
    ];
  } else {
    return [
      FlSpot(1, data[0]),
      FlSpot(2, data[1]),
      FlSpot(3, data[2]),
      FlSpot(4, data[3]),
      FlSpot(5, data[4]),
      FlSpot(6, data[5]),
      FlSpot(7, data[6]),
    ];
  }
}
