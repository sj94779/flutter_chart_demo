import 'package:flutter/material.dart';
import 'package:flutter_chart_demo/bar/syncfusion/syncfusion_bar_chart_one.dart';
import 'package:flutter_chart_demo/bar/syncfusion/syncfusion_bar_chart_two.dart';
import '../../resources/app_colors.dart';

class SyncfusionBarChartScreen extends StatefulWidget {
  const SyncfusionBarChartScreen({super.key});

  @override
  State<SyncfusionBarChartScreen> createState() =>
      _SyncfusionBarChartScreenState();
}

class _SyncfusionBarChartScreenState extends State<SyncfusionBarChartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.darkBlue,
          iconTheme: const IconThemeData(color: AppColors.contentColorWhite),
          title: const Text(
            "Syncfusion Bar Chart",
            style: TextStyle(color: AppColors.contentColorWhite),
          ),
        ),
        body: const SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  SyncfusionBarChartOne(),
                  SizedBox(
                    height: 30,
                  ),
                  SyncfusionBarChartTwo(),
                ],
              ),
            ),
          ),
        ));
  }
}
