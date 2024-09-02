import 'package:flutter/material.dart';
import 'package:flutter_chart_demo/scatter/custom_without_dependency/scatter_chart_widget.dart';
import '../../resources/app_colors.dart';



class CustomScatterChartScreen extends StatefulWidget {
  const CustomScatterChartScreen({super.key});

  @override
  State<CustomScatterChartScreen> createState() => _CustomScatterChartScreenState();
}

class _CustomScatterChartScreenState extends State<CustomScatterChartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.darkBlue,
          iconTheme: const IconThemeData(color: AppColors.contentColorWhite),
          title: const Text(
            "Custom Scatter Chart",
            style: TextStyle(color: AppColors.contentColorWhite),
          ),
        ),
        body:  SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child:
              ScatterChart(
                data: const [
                  Offset(10, 20),
                  Offset(30, 40),
                  Offset(50, 60),
                  Offset(70, 80),
                  Offset(90, 100),
                ],
                xLabels: const ['0', '20', '40', '60', '80', '100'],
                yLabels: const ['0', '20', '40', '60', '80', '100'],
              ),
            ),
          ),
        ));
  }
}
