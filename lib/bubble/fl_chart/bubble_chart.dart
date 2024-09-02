import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../resources/app_colors.dart';
import 'model/bubble_chart_data_model.dart';

class BubbleChart extends StatelessWidget {
  final List<BubbleChartData> bubbleData;
  bool fitInsideLeftTitle = false;

  BubbleChart({required this.bubbleData});

  @override
  Widget build(BuildContext context) {
    return ScatterChart(
      ScatterChartData(
        scatterSpots: bubbleData.map((data) {
          return ScatterSpot(
            data.x,
            data.y,
            dotPainter: FlDotCirclePainter(color: Colors.blue, radius: data.size),
            // color: Colors.blue,
            // radius: data.size,
          );
        }).toList(),
        borderData: FlBorderData(
          show: true,
          border: const Border(
            bottom: BorderSide(color: AppColors.darkBlue),
            left: BorderSide(color: AppColors.darkBlue),
            right: BorderSide(color: Colors.transparent),
            top: BorderSide(color: Colors.transparent),

          ),
        ),
        gridData: const FlGridData(
          show: true,
          drawVerticalLine: true,
          drawHorizontalLine: true,
        ),
        titlesData: FlTitlesData(
          topTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,

            ),

          ),
          rightTitles: AxisTitles(
            sideTitles:
            SideTitles(
              showTitles: false,

            ),


          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              interval: 1,
              getTitlesWidget:
              bottomTitleWidgets,
            ),

          ),
          leftTitles: AxisTitles(
            sideTitles:
            SideTitles(
              showTitles: true,
              reservedSize: 40,
              interval: 1,
              getTitlesWidget:
              leftTitleWidgets
            ),


          ),

      ),)
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    if (value % 1 != 0) {
      return Container();
    }
    const style = TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 14,
      color: AppColors.darkBlue
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = '';
        break;
      case 10:
        text = '10';
        break;
      case 30:
        text = '30';
        break;
      case 50:
        text = '50';
        break;
      case 70:
        text = '70';
        break;
      case 90:
        text = '90';
        break;
      default:
        return Container();
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 6,
      fitInside: fitInsideLeftTitle
          ? SideTitleFitInsideData.fromTitleMeta(meta, distanceFromEdge: 4,enabled: false)
          : SideTitleFitInsideData.fromTitleMeta(meta),
      child: Text(text, style: style, textAlign: TextAlign.left),
    );;
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    if (value % 1 != 0) {
      return Container();
    }
    const style = TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 14,
        color: AppColors.darkBlue
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = '';
        break;
      case 20:
        text = '20';
        break;
      case 40:
        text = '40';
        break;
      case 60:
        text = '60';
        break;
      case 80:
        text = '80';
        break;
      case 100:
        text = '100';
        break;
      default:
        return Container();
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 6,
      fitInside: fitInsideLeftTitle
          ? SideTitleFitInsideData.fromTitleMeta(meta, distanceFromEdge: 4,enabled: false)
          : SideTitleFitInsideData.fromTitleMeta(meta),
      child: Text(text, style: style, textAlign: TextAlign.left),
    );;
  }
}