import 'dart:math';

import 'package:flutter/material.dart';

import 'custom_pie_chart_screen.dart';

class PieChartPainter extends CustomPainter {
  final List<PieSlice> slices;

  PieChartPainter({required this.slices});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..style = PaintingStyle.fill;

    final double total = slices.fold(0, (sum, slice) => sum + slice.value);
    double startAngle = -90.0;

    for (var slice in slices) {
      final double sweepAngle = (slice.value / total) * 360.0;
      paint.color = slice.color;

      canvas.drawArc(
        Rect.fromLTWH(0, 0, size.width, size.height),
        _degToRad(startAngle),
        _degToRad(sweepAngle),
        true,
        paint,
      );

      // Calculate center of slice for label placement
      final double middleAngle = startAngle + sweepAngle / 2;
      final double radius = size.width / 2;
      final double x = radius + radius * 0.5 * cos(_degToRad(middleAngle));
      final double y = radius + radius * 0.5 * sin(_degToRad(middleAngle));

      final TextPainter textPainter = TextPainter(
        text: TextSpan(
          text: slice.label,
          style: TextStyle(color: Colors.black, fontSize: 14),
        ),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      )..layout();

      textPainter.paint(canvas, Offset(x - textPainter.width / 2, y - textPainter.height / 2));

      startAngle += sweepAngle;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;

  double _degToRad(double degrees) => degrees * (3.141592653589793 / 180.0);
}
