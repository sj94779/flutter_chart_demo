import 'package:flutter/material.dart';
import '../../resources/app_colors.dart';
import 'line_chart_widget.dart';
import 'model/axis_config.dart';
import 'model/line_chart_data.dart';

class CustomLineChart extends StatefulWidget {
  const CustomLineChart({super.key});

  @override
  State<CustomLineChart> createState() => _CustomLineChartState();
}

class _CustomLineChartState extends State<CustomLineChart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.darkBlue,
          iconTheme: const IconThemeData(color: AppColors.contentColorWhite),
          title: const Text(
            "Custom Line Chart",
            style: TextStyle(color: AppColors.contentColorWhite),
          ),
        ),
        body:  SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child:
              LineChart(
                LineChartData([
                  ChartPoint(1, 200, 'A'),
                  ChartPoint(2, 150, 'B'),
                  ChartPoint(3, 300, 'C'),
                  ChartPoint(4, 250, 'D'),
                  ChartPoint(5, 400, 'E'),
                ]),
                AxisConfig(minX: 1, maxX: 5, minY: 0, maxY: 400),
              ),
            ),
          ),
        ));
  }
}
