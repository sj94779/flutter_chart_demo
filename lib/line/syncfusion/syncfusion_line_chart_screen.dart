import 'package:flutter/material.dart';
import 'package:flutter_chart_demo/line/syncfusion/syncfusion_line_chart_one.dart';
import 'package:flutter_chart_demo/line/syncfusion/syncfusion_line_chart_three.dart';
import 'package:flutter_chart_demo/line/syncfusion/syncfusion_line_chart_two.dart';
import '../../resources/app_colors.dart';

class SyncfusionLineChartScreen extends StatefulWidget {
  const SyncfusionLineChartScreen({super.key});

  @override
  State<SyncfusionLineChartScreen> createState() =>
      _SyncfusionLineChartScreenState();
}

class _SyncfusionLineChartScreenState extends State<SyncfusionLineChartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.darkBlue,
          iconTheme: const IconThemeData(color: AppColors.contentColorWhite),
          title: const Text(
            "Syncfusion Line Chart",
            style: TextStyle(color: AppColors.contentColorWhite),
          ),
        ),
        body: const SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Column(
                children: [
                  SyncfusionLineChartOne(),
                  SizedBox(
                    height: 30,
                  ),
                  SyncfusionLineChartTwo(),
                  SizedBox(
                    height: 30,
                  ),
                  SyncfusionLineChartThree(),
                ],
              ),
            ),
          ),
        ));
  }
}
