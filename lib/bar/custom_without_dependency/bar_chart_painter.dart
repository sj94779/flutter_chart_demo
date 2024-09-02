import 'package:flutter/material.dart';

import '../../resources/app_colors.dart';
import 'model/bar_chart_data.dart';
import 'model/axis_config.dart';

class BarChartPainter extends CustomPainter {
  final BarChartData data;
  final AxisConfig axisConfig;

  BarChartPainter(this.data, this.axisConfig);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint barPaint = Paint()
      ..color = AppColors.darkBlue
      ..style = PaintingStyle.fill;

    final Paint axisPaint = Paint()
      ..color = AppColors.darkBlue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    final TextPainter textPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    // Draw X and Y axes
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

    // Draw bars and data labels
    for (var bar in data.bars) {
      final barXPos = 50 + (bar.x - axisConfig.minX) / (axisConfig.maxX - axisConfig.minX) * (size.width - 100);
      final barYPos = size.height - 50 - (bar.height - axisConfig.minY) / (axisConfig.maxY - axisConfig.minY) * (size.height - 100);

      final barWidth = (size.width - 300) / data.bars.length * 0.6; // Adjust bar width as needed
      final barHeight = size.height - 50 - barYPos;

      canvas.drawRect(
        Rect.fromLTWH(
          barXPos - barWidth / 2,
          barYPos,
          barWidth,
          barHeight,
        ),
        barPaint,
      );

      // Draw data labels
      textPainter.text = TextSpan(
        text: bar.label,
        style: TextStyle(color: AppColors.darkBlue, fontSize: 12),
      );
      textPainter.layout();
      textPainter.paint(canvas, Offset(barXPos - textPainter.width / 2, barYPos - textPainter.height - 5));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
