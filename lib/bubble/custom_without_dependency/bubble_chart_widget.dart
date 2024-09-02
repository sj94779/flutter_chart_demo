import 'package:flutter/material.dart';

import 'bubble_chart_painter.dart';
import 'model/bubble_data_model.dart';

class BubbleChart extends StatelessWidget {
  final List<BubbleData> data;
  final List<String> xLabels;
  final List<String> yLabels;

  BubbleChart({
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
        painter: BubbleChartPainter(
          data: data,
          xLabels: xLabels,
          yLabels: yLabels,
        ),
      ),
    );
  }
}
