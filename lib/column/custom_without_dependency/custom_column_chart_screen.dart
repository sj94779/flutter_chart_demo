import 'package:flutter/material.dart';
import '../../resources/app_colors.dart';
import 'column_chart_widget.dart';


class CustomColumnChart extends StatefulWidget {
  const CustomColumnChart({super.key});

  @override
  State<CustomColumnChart> createState() => _CustomColumnChartState();
}

class _CustomColumnChartState extends State<CustomColumnChart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.darkBlue,
          iconTheme: const IconThemeData(color: AppColors.contentColorWhite),
          title: const Text(
            "Custom Column Chart",
            style: TextStyle(color: AppColors.contentColorWhite),
          ),
        ),
        body:  SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child:
              ColumnChart(
                data: const [10, 20, 30, 40, 50],
                labels: const ['A', 'B', 'C', 'D', 'E'],
              ),
            ),
          ),
        ));
  }
}
