import 'package:flutter/material.dart';
import '../../resources/app_colors.dart';
import 'syncfusion_bubble_chart_one.dart';
import 'syncfusion_bubble_chart_two.dart';

class SyncfusionBubbleChartScreen extends StatefulWidget {
  const SyncfusionBubbleChartScreen({super.key});

  @override
  State<SyncfusionBubbleChartScreen> createState() => _SyncfusionBubbleChartScreenState();
}

class _SyncfusionBubbleChartScreenState extends State<SyncfusionBubbleChartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.darkBlue,
          iconTheme: const IconThemeData(color: AppColors.contentColorWhite),
          title: const Text(
            "Bubble Chart",
            style: TextStyle(color: AppColors.contentColorWhite),
          ),
        ),
        body: const SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Column(
                children: [
                  SyncfusionBubbleChartOne(),
                  SizedBox(
                    height: 30,
                  ),
                  SyncfusionBubbleChartTwo(),
                ],
              ),
            ),
          ),
        ));
  }
}
