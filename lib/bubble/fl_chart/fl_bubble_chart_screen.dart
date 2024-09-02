import 'package:flutter/material.dart';
import 'package:flutter_chart_demo/line/fl_charts/fl_line_chart_two.dart';
import '../../resources/app_colors.dart';
import 'fl_bubble_chart_one.dart';


class flBubbleChartScreen extends StatefulWidget {
  const flBubbleChartScreen({super.key});

  @override
  State<flBubbleChartScreen> createState() => _flBubbleChartScreenState();
}

class _flBubbleChartScreenState extends State<flBubbleChartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.darkBlue,
          iconTheme: const IconThemeData(color: AppColors.contentColorWhite),
          title: const Text(
            "fl Bubble Chart",
            style: TextStyle(color: AppColors.contentColorWhite),
          ),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 30,),
                  const flBubbleChartOne(),

                ],
              ),
            ),
          ),
        ));
  }
}
