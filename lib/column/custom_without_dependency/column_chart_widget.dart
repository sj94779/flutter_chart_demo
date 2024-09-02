import 'package:flutter/material.dart';

import 'column_chart_painter.dart';

class ColumnChart extends StatelessWidget {
  final List<double> data;
  final List<String> labels;

  ColumnChart({
    required this.data,
    required this.labels,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: CustomPaint(
        size: Size(double.infinity, 300.0), // Set the desired height
        painter: ColumnChartPainter(
          data: data,
          labels: labels,
        ),
      ),
    );
  }
}