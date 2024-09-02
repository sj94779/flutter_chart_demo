import 'package:flutter/material.dart';
import 'package:flutter_chart_demo/scatter/custom_without_dependency/scatter_chart_painter.dart';

class ScatterChart extends StatelessWidget {
  final List<Offset> data;
  final List<String> xLabels;
  final List<String> yLabels;

  ScatterChart({
    required this.data,
    required this.xLabels,
    required this.yLabels,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: CustomPaint(
        size: Size(double.infinity, 300.0), // Set the desired height
        painter: ScatterChartPainter(
          data: data,
          xLabels: xLabels,
          yLabels: yLabels,
        ),
      ),
    );
  }
}