import 'package:flutter/material.dart';
import 'package:flutter_chart_demo/line/fl_charts/fl_line_chart_two.dart';
import '../../resources/app_colors.dart';
import 'fl_line_chart_one.dart';
import 'fl_line_chart_three.dart';

class flLineChartScreen extends StatefulWidget {
  const flLineChartScreen({super.key});

  @override
  State<flLineChartScreen> createState() => _flLineChartScreenState();
}

class _flLineChartScreenState extends State<flLineChartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.darkBlue,
          iconTheme: const IconThemeData(color: AppColors.contentColorWhite),
          title: const Text(
            "fl line Chart",
            style: TextStyle(color: AppColors.contentColorWhite),
          ),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Column(
                children: [
                  const flLineChartOne(),
                  const SizedBox(
                    height: 30,
                  ),
                  const flLineChartTwo(),
                  const SizedBox(
                    height: 30,
                  ),
                  flLineChartThree(),
                ],
              ),
            ),
          ),
        ));
  }
}
