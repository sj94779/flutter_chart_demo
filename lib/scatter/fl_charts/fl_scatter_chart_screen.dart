import 'package:flutter/material.dart';
import '../../resources/app_colors.dart';
import 'fl_scatter_chart_one.dart';
import 'fl_scatter_chart_two.dart';

class flScatterChartScreen extends StatefulWidget {
  const flScatterChartScreen({super.key});

  @override
  State<flScatterChartScreen> createState() => _flScatterChartScreenState();
}

class _flScatterChartScreenState extends State<flScatterChartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.darkBlue,
          iconTheme: const IconThemeData(color: AppColors.contentColorWhite),
          title: const Text(
            "fl Scatter Chart",
            style: TextStyle(color: AppColors.contentColorWhite),
          ),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Column(
                children: [
                  flScatterChartOne(),
                  const SizedBox(
                    height: 30,
                  ),
                  const flScatterChartTwo(),
                ],
              ),
            ),
          ),
        ));
  }
}
