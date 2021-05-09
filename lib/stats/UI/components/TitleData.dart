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
          var lenght = value.toString().length;
          if (lenght <= 5) {
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
          } else if (lenght <= 6) {
            switch (value.toInt()) {
              case 1:
                return '100k';
              case 2:
                return '200k';
              case 3:
                return '300k';
              case 4:
                return '400k';
              case 5:
                return '500k';
            }
          } else if (lenght <= 4) {
            switch (value.toInt()) {
              case 1:
                return '1k';
              case 2:
                return '2k';
              case 3:
                return '3k';
              case 4:
                return '4k';
              case 5:
                return '5k';
            }
          } else if (lenght <= 6) {
            switch (value.toInt()) {
              case 1:
                return '1 mil';
              case 2:
                return '2 mil';
              case 3:
                return '3 mil';
              case 4:
                return '4 mil';
              case 5:
                return '5 mil';
            }
          }
        },
      ));
}
