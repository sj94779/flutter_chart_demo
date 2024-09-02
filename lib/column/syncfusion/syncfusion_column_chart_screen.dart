import 'package:flutter/material.dart';
import '../../resources/app_colors.dart';
import 'syncfusion_column_chart_one.dart';
import 'column_chart_two.dart';

class SyncfusionColumnChartScreen extends StatefulWidget {
  const SyncfusionColumnChartScreen({super.key});

  @override
  State<SyncfusionColumnChartScreen> createState() => _SyncfusionColumnChartScreenState();
}

class _SyncfusionColumnChartScreenState extends State<SyncfusionColumnChartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.darkBlue,
          iconTheme: const IconThemeData(color: AppColors.contentColorWhite),
          title: const Text(
            "Column Chart",
            style: TextStyle(color: AppColors.contentColorWhite),
          ),
        ),
        body: const SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Column(
                children: [
                  SyncfusionColumnChartOne(),
                  SizedBox(
                    height: 30,
                  ),
                  SyncfusionColumnChartTwo(),
                ],
              ),
            ),
          ),
        ));
  }
}
