import 'package:flutter/material.dart';

import 'line_chart_painter.dart';
import 'model/axis_config.dart';
import 'model/line_chart_data.dart';

class LineChart extends StatelessWidget {
  final LineChartData data;
  final AxisConfig axisConfig;

  LineChart(this.data, this.axisConfig);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300.0,
      child: CustomPaint(
        painter: LineChartPainter(data, axisConfig),
        child: Container(),
      ),
    );
  }
}