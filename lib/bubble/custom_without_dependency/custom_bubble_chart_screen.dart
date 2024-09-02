import 'package:flutter/material.dart';
import '../../resources/app_colors.dart';
import 'bubble_chart_painter.dart';
import 'bubble_chart_widget.dart';
import 'model/bubble_data_model.dart';



class CustomBubbleChartScreen extends StatefulWidget {
  const CustomBubbleChartScreen({super.key});

  @override
  State<CustomBubbleChartScreen> createState() => _CustomBubbleChartScreenState();
}

class _CustomBubbleChartScreenState extends State<CustomBubbleChartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.darkBlue,
          iconTheme: const IconThemeData(color: AppColors.contentColorWhite),
          title: const Text(
            "Custom Bubble Chart",
            style: TextStyle(color: AppColors.contentColorWhite),
          ),
        ),
        body:  SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child:
              BubbleChart(
                data: [
                  BubbleData(x: 10, y: 20, size: 30),
                  BubbleData(x: 30, y: 40, size: 60),
                  BubbleData(x: 50, y: 60, size: 90),
                  BubbleData(x: 70, y: 80, size: 120),
                  BubbleData(x: 90, y: 100, size: 150),
                ],
                xLabels: ['0', '20', '40', '60', '80', '100'],
                yLabels: ['0', '20', '40', '60', '80', '100'],
              ),
            ),
          ),
        ));
  }
}
