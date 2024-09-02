import 'package:flutter/material.dart';
import 'package:flutter_chart_demo/line/fl_charts/fl_line_chart_two.dart';
import '../../resources/app_colors.dart';
import 'fl_pie_chart_one.dart';
import 'fl_pie_chart_three.dart';
import 'fl_pie_chart_two.dart';


class flPieChartScreen extends StatefulWidget {
  const flPieChartScreen({super.key});

  @override
  State<flPieChartScreen> createState() => _flPieChartScreenState();
}

class _flPieChartScreenState extends State<flPieChartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.darkBlue,
          iconTheme: const IconThemeData(color: AppColors.contentColorWhite),
          title: const Text(
            "fl Pie Chart",
            style: TextStyle(color: AppColors.contentColorWhite),
          ),
        ),
        body: const SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Column(
                children: [
                  flPieChartOne(),

                  FlPieChartTwo(),

                  FlPieChartThree(),

                ],
              ),
            ),
          ),
        ));
  }
}
