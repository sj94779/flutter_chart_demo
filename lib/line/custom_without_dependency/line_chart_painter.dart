import 'dart:ui';

import 'package:flutter/material.dart';

import '../../resources/app_colors.dart';
import 'model/axis_config.dart';
import 'model/line_chart_data.dart';

class LineChartPainter extends CustomPainter {
  final LineChartData data;
  final AxisConfig axisConfig;

  LineChartPainter(this.data, this.axisConfig);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint linePaint = Paint()
      ..color = AppColors.darkBlue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final Paint axisPaint = Paint()
      ..color = AppColors.darkBlue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final TextPainter textPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    // Draw axes
    canvas.drawLine(
      Offset(50, size.height - 50),
      Offset(size.width - 50, size.height - 50),
      axisPaint,
    ); // X axis

    canvas.drawLine(
      Offset(50, size.height - 50),
      Offset(50, 50),
      axisPaint,
    ); // Y axis

    // Draw X axis labels
    for (double x = axisConfig.minX; x <= axisConfig.maxX; x += (axisConfig.maxX - axisConfig.minX) / 5) {
      final xPos = 50 + (x - axisConfig.minX) / (axisConfig.maxX - axisConfig.minX) * (size.width - 100);
      canvas.drawLine(
        Offset(xPos, size.height - 50),
        Offset(xPos, size.height - 45),
        axisPaint,
      );

      textPainter.text = TextSpan(
        text: x.toStringAsFixed(0),
        style: TextStyle(color: AppColors.darkBlue, fontSize: 12),
      );
      textPainter.layout();
      textPainter.paint(canvas, Offset(xPos - textPainter.width / 2, size.height - 35));
    }

    // Draw Y axis labels
    for (double y = axisConfig.minY; y <= axisConfig.maxY; y += (axisConfig.maxY - axisConfig.minY) / 5) {
      final yPos = size.height - 50 - (y - axisConfig.minY) / (axisConfig.maxY - axisConfig.minY) * (size.height - 100);
      canvas.drawLine(
        Offset(50, yPos),
        Offset(55, yPos),
        axisPaint,
      );

      textPainter.text = TextSpan(
        text: y.toStringAsFixed(0),
        style: TextStyle(color: AppColors.darkBlue, fontSize: 12),
      );
      textPainter.layout();
      textPainter.paint(canvas, Offset(60, yPos - textPainter.height / 2));
    }

    // Draw the line chart
    if (data.points.isEmpty) return;

    final path = Path();
    path.moveTo(
      50 + (data.points[0].x - axisConfig.minX) / (axisConfig.maxX - axisConfig.minX) * (size.width - 100),
      size.height - 50 - (data.points[0].y - axisConfig.minY) / (axisConfig.maxY - axisConfig.minY) * (size.height - 100),
    );

    for (int i = 1; i < data.points.length; i++) {
      path.lineTo(
        50 + (data.points[i].x - axisConfig.minX) / (axisConfig.maxX - axisConfig.minX) * (size.width - 100),
        size.height - 50 - (data.points[i].y - axisConfig.minY) / (axisConfig.maxY - axisConfig.minY) * (size.height - 100),
      );
    }

    canvas.drawPath(path, linePaint);

    // Draw data point labels
    for (var point in data.points) {
      final xPos = 50 + (point.x - axisConfig.minX) / (axisConfig.maxX - axisConfig.minX) * (size.width - 100);
      final yPos = size.height - 50 - (point.y - axisConfig.minY) / (axisConfig.maxY - axisConfig.minY) * (size.height - 100);

      textPainter.text = TextSpan(
        text: point.label,
        style: TextStyle(color: AppColors.darkBlue, fontSize: 12),
      );
      textPainter.layout();
      textPainter.paint(canvas, Offset(xPos - textPainter.width / 2, yPos - textPainter.height - 5));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}