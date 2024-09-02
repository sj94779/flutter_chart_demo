import 'package:flutter/material.dart';
import 'package:flutter_chart_demo/scatter/syncfusion/syncfusion_scatter_chart_one.dart';
import '../../resources/app_colors.dart';

class SyncfusionScatterChartScreen extends StatefulWidget {
  const SyncfusionScatterChartScreen({super.key});

  @override
  State<SyncfusionScatterChartScreen> createState() =>
      _SyncfusionScatterChartScreenState();
}

class _SyncfusionScatterChartScreenState
    extends State<SyncfusionScatterChartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.darkBlue,
          iconTheme: const IconThemeData(color: AppColors.contentColorWhite),
          title: const Text(
            "Syncfusion Scatter Chart",
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
                  SyncfusionScatterChartOne(),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
