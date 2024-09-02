import 'package:flutter/material.dart';

import '../../resources/app_colors.dart';

class ColumnChartPainter extends CustomPainter {
  final List<double> data;
  final List<String> labels;
  final double maxValue;
  final double barWidth;
  final double axisMargin;
  final double labelMargin;
  final double textSize;

  ColumnChartPainter({
    required this.data,
    required this.labels,
    this.maxValue = 100.0,
    this.barWidth = 30.0,
    this.axisMargin = 40.0,
    this.labelMargin = 10.0,
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

    final double chartHeight = size.height;
    final double chartWidth = size.width;
    final double spaceBetweenBars = (chartWidth - axisMargin - (barWidth * data.length)) / (data.length + 1);
    final double maxBarHeight = chartHeight * 0.8; // 80% of the chart height

    // Draw axis lines
    canvas.drawLine(Offset(axisMargin, chartHeight - axisMargin), Offset(chartWidth, chartHeight - axisMargin), axisPaint); // X-axis
    canvas.drawLine(Offset(axisMargin, chartHeight - axisMargin), Offset(axisMargin, 0), axisPaint); // Y-axis

    // Draw bars and data labels
    for (int i = 0; i < data.length; i++) {
      final double barHeight = (data[i] / maxValue) * maxBarHeight;
      final double xOffset = axisMargin + i * (barWidth + spaceBetweenBars);
      final Rect barRect = Rect.fromLTWH(xOffset, chartHeight - barHeight - axisMargin, barWidth, barHeight);

      // Draw the bar
      canvas.drawRect(barRect, paint);

      // Draw the data label
      textPaint.text = TextSpan(
        text: '${data[i]}',
        style: TextStyle(color: AppColors.darkBlue, fontSize: textSize),
      );
      textPaint.layout();
      textPaint.paint(canvas, Offset(xOffset + (barWidth / 2) - (textPaint.width / 2), chartHeight - barHeight - axisMargin - textPaint.height - 5));
    }

    // Draw X-axis labels
    for (int i = 0; i < labels.length; i++) {
      textPaint.text = TextSpan(
        text: labels[i],
        style: TextStyle(color: AppColors.darkBlue, fontSize: textSize),
      );
      textPaint.layout();
      final double xOffset = axisMargin + i * (barWidth + spaceBetweenBars) + (barWidth / 2) - (textPaint.width / 2);
      textPaint.paint(canvas, Offset(xOffset, chartHeight - axisMargin + 5));
    }

    // Draw Y-axis labels
    for (int i = 0; i <= 5; i++) { // Adjust number of ticks based on your needs
      final double yValue = maxValue * (i / 5);
      final double yPosition = chartHeight - axisMargin - (yValue / maxValue) * maxBarHeight;

      textPaint.text = TextSpan(
        text: '${yValue.toStringAsFixed(0)}',
        style: TextStyle(color: AppColors.darkBlue, fontSize: textSize),
      );
      textPaint.layout();
      textPaint.paint(canvas, Offset(5, yPosition - textPaint.height / 2));

      // Draw horizontal grid lines
      if (i > 0) {
        canvas.drawLine(
          Offset(axisMargin, yPosition),
          Offset(chartWidth, yPosition),
          Paint()
            ..color = AppColors.darkGrey
            ..style = PaintingStyle.stroke
            ..strokeWidth = 0.5,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
