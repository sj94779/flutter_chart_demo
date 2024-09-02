import 'package:flutter/material.dart';

import '../../resources/app_colors.dart';

class ScatterChartPainter extends CustomPainter {
  final List<Offset> data; // Data points as (x, y) coordinates
  final List<String> xLabels; // Labels for the X-axis
  final List<String> yLabels; // Labels for the Y-axis
  final double maxX;
  final double maxY;
  final double axisMargin;
  final double pointRadius;
  final double textSize;

  ScatterChartPainter({
    required this.data,
    required this.xLabels,
    required this.yLabels,
    this.maxX = 100.0,
    this.maxY = 100.0,
    this.axisMargin = 40.0,
    this.pointRadius = 5.0,
    this.textSize = 12.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.darkBlue
      ..style = PaintingStyle.fill;

    final axisPaint = Paint()
      ..color = AppColors.darkBlue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final textPaint = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
   //   ..textHeightBehavior = TextHeightBehavior.applyHeightToFirstAscent;

    final double chartWidth = size.width;
    final double chartHeight = size.height;
    final double maxPointX = chartWidth - axisMargin;
    final double maxPointY = chartHeight - axisMargin;

    // Draw axis lines
    canvas.drawLine(
      Offset(axisMargin, chartHeight - axisMargin),
      Offset(chartWidth, chartHeight - axisMargin),
      axisPaint,
    ); // X-axis
    canvas.drawLine(
      Offset(axisMargin, chartHeight - axisMargin),
      Offset(axisMargin, 0),
      axisPaint,
    ); // Y-axis

    // Draw data points
    for (var point in data) {
      final double x = axisMargin + (point.dx / maxX) * (chartWidth - axisMargin * 2);
      final double y = chartHeight - axisMargin - (point.dy / maxY) * (chartHeight - axisMargin * 2);

      // Draw the point
      canvas.drawCircle(Offset(x, y), pointRadius, paint);

      // Draw the data label
      textPaint.text = TextSpan(
        text: '(${point.dx.toStringAsFixed(1)}, ${point.dy.toStringAsFixed(1)})',
        style: TextStyle(color: AppColors.darkBlue, fontSize: textSize),
      );
      textPaint.layout();
      textPaint.paint(
        canvas,
        Offset(x + pointRadius, y - textPaint.height - 5),
      );
    }

    // Draw X-axis labels
    for (int i = 0; i < xLabels.length; i++) {
      final label = xLabels[i];
      final double xOffset = axisMargin + (i / (xLabels.length - 1)) * (chartWidth - axisMargin * 2);
      textPaint.text = TextSpan(
        text: label,
        style: TextStyle(color: AppColors.darkBlue, fontSize: textSize),
      );
      textPaint.layout();
      textPaint.paint(
        canvas,
        Offset(xOffset - textPaint.width / 2, chartHeight - axisMargin + 5),
      );
    }

    // Draw Y-axis labels
    for (int i = 0; i < yLabels.length; i++) {
      final label = yLabels[i];
      final double yOffset = chartHeight - axisMargin - (i / (yLabels.length - 1)) * (chartHeight - axisMargin * 2);
      textPaint.text = TextSpan(
        text: label,
        style: TextStyle(color: AppColors.darkBlue, fontSize: textSize),
      );
      textPaint.layout();
      textPaint.paint(
        canvas,
        Offset(5, yOffset - textPaint.height / 2),
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
