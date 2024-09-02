import 'package:flutter/material.dart';
import 'bar_chart_painter.dart';
import 'model/bar_chart_data.dart';
import 'model/axis_config.dart';

class BarChart extends StatelessWidget {
  final BarChartData data;
  final AxisConfig axisConfig;

  BarChart(this.data, this.axisConfig);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300.0,
      child: CustomPaint(
        painter: BarChartPainter(data, axisConfig),
        child: Container(),
      ),
    );
  }
}
