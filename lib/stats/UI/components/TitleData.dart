//

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class LineTitles {
  static getTitleData() => FlTitlesData(
      show: true,
      bottomTitles: SideTitles(
        showTitles: true,
        reservedSize: 15,
        getTextStyles: (value) => const TextStyle(
            color: Color(0xff68737d),
            fontWeight: FontWeight.bold,
            fontSize: 12),
        getTitles: (value) {
          switch (value.toInt()) {
            case 1:
              return 'MON';
            case 2:
              return 'TUE';
            case 3:
              return 'WED';
            case 4:
              return 'THU';
            case 5:
              return 'FRI';
            case 6:
              return 'SAT';
            case 7:
              return 'SAN';
          }
        },
      ),
      leftTitles: SideTitles(
        showTitles: true,
        reservedSize: 15,
        getTextStyles: (value) => const TextStyle(
            color: Color(0xff68737d),
            fontWeight: FontWeight.bold,
            fontSize: 12),
        getTitles: (value) {
          switch (value.toInt()) {
            case 1:
              return '10k';
            case 2:
              return '20k';
            case 3:
              return '30k';
            case 4:
              return '40k';
            case 5:
              return '50k';
          }
        },
      ));
}
