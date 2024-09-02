import 'package:flutter/material.dart';
import '../../resources/app_colors.dart';
import 'bar_chart_widget.dart';
import 'model/bar_chart_data.dart';
import 'model/axis_config.dart';



class CustomBarChart extends StatefulWidget {
  const CustomBarChart({super.key});

  @override
  State<CustomBarChart> createState() => _CustomBarChartState();
}

class _CustomBarChartState extends State<CustomBarChart> {
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
              BarChart(
                BarChartData([
                 // ChartBar(1, 0, 200, 'A'),
                  ChartBar(2, 0, 150, 'A'),
                  ChartBar(3, 0, 300, 'B'),
                  ChartBar(4, 0, 250, 'C'),
                  ChartBar(5, 0, 400, 'D'),
                ]),
                AxisConfig(minX: 1, maxX: 5, minY: 0, maxY: 400),
              ),

            ),
          ),
        ));
  }
}
