import 'package:flutter/material.dart';

import '../../resources/app_colors.dart';
import 'model/bubble_data_model.dart';

class BubbleChartPainter extends CustomPainter {
  final List<BubbleData> data;
  final List<String> xLabels;
  final List<String> yLabels;
  final double maxX;
  final double maxY;
  final double axisMargin;
  final double textSize;
  final double minBubbleSize;
  final double maxBubbleSize;

  BubbleChartPainter({
    required this.data,
    required this.xLabels,
    required this.yLabels,
    this.maxX = 100.0,
    this.maxY = 100.0,
    this.axisMargin = 40.0,
    this.textSize = 12.0,
    this.minBubbleSize = 5.0,
    this.maxBubbleSize = 20.0,
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

    // Draw bubbles and data labels
    for (var bubble in data) {
      final double x = axisMargin + (bubble.x / maxX) * (chartWidth - axisMargin * 2);
      final double y = chartHeight - axisMargin - (bubble.y / maxY) * (chartHeight - axisMargin * 2);
      final double size = minBubbleSize + ((bubble.size / 100) * (maxBubbleSize - minBubbleSize));

      // Draw the bubble
      canvas.drawCircle(Offset(x, y), size, paint);

      // Draw the data label
      textPaint.text = TextSpan(
        text: '(${bubble.x.toStringAsFixed(1)}, ${bubble.y.toStringAsFixed(1)})',
        style: TextStyle(color: AppColors.darkBlue, fontSize: textSize),
      );
      textPaint.layout();
      textPaint.paint(
        canvas,
        Offset(x + size, y - textPaint.height - 5),
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


