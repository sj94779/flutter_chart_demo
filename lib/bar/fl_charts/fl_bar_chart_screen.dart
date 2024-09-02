import 'package:flutter/material.dart';
import '../../resources/app_colors.dart';
import 'fl_bar_chart_one.dart';
import 'fl_bar_chart_seven.dart';
import 'fl_bar_chart_three.dart';
import 'fl_bar_chart_two.dart';

class flBarChartScreen extends StatefulWidget {
  const flBarChartScreen({super.key});

  @override
  State<flBarChartScreen> createState() => _flBarChartPageState();
}

class _flBarChartPageState extends State<flBarChartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.darkBlue,
          iconTheme: const IconThemeData(color: AppColors.contentColorWhite),
          title: const Text(
            "fl bar Chart",
            style: TextStyle(color: AppColors.contentColorWhite),
          ),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Column(
                children: [
                  flBarChartOne(),
                  const SizedBox(
                    height: 30,
                  ),
                  flBarChartTwo(),
                  const SizedBox(
                    height: 30,
                  ),
                  const flBarChartThree(),
                  const SizedBox(
                    height: 30,
                  ),
                  flBarChartSeven()
                ],
              ),
            ),
          ),
        ));
  }
}
