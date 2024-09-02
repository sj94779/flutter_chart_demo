import 'package:flutter/material.dart';

import 'fl_bubble_chart_one_widget.dart';

class flBubbleChartOne extends StatefulWidget {
  const flBubbleChartOne({super.key});

  @override
  State<flBubbleChartOne> createState() => _flBubbleChartOneState();
}

class _flBubbleChartOneState extends State<flBubbleChartOne> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BubbleChartWidget(),
    );
  }
}