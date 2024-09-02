import 'package:flutter/material.dart';

import 'bubble_chart.dart';
import 'model/bubble_chart_data_model.dart';


class BubbleChartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: BubbleChart(
        bubbleData: [
          BubbleChartData(
            x: 0,
            y: 0,
            size: 1,
          ),
          BubbleChartData(
            x: 10,
            y: 20,
            size: 3,
          ),
          BubbleChartData(
            x: 30,
            y: 40,
            size: 6,
          ),
          BubbleChartData(
            x: 50,
            y: 60,
            size: 9,
          ),
          BubbleChartData(
            x: 70,
            y: 80,
            size: 12,
          ),
          BubbleChartData(
            x: 90,
            y: 100,
            size: 15,
          ),
        ],
      ),
    );
  }
}