import 'package:flutter/material.dart';
import 'package:flutter_chart_demo/pie/custom_without_dependency/pie_chart_painter.dart';
import '../../resources/app_colors.dart';
import '../../scatter/custom_without_dependency/scatter_chart_painter.dart';


class CustomPieChartScreen extends StatefulWidget {
  const CustomPieChartScreen({super.key});

  @override
  State<CustomPieChartScreen> createState() => _CustomPieChartScreenState();
}

class _CustomPieChartScreenState extends State<CustomPieChartScreen> {

  final List<PieSlice> pieData = [
    PieSlice(value: 25, color: Colors.red, label: 'Red'),
    PieSlice(value: 35, color: Colors.blue, label: 'Blue'),
    PieSlice(value: 20, color: Colors.green, label: 'Green'),
    PieSlice(value: 20, color: Colors.yellow, label: 'Yellow'),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.darkBlue,
          iconTheme: const IconThemeData(color: AppColors.contentColorWhite),
          title: const Text(
            "Custom Pie Chart",
            style: TextStyle(color: AppColors.contentColorWhite),
          ),
        ),
        body:  SingleChildScrollView(
          child: SafeArea(
            child:
    Center(
    child: Column(
      children: [
        SizedBox(height: 30,),
        Container(
        width: 300,
        height: 300,
        child: CustomPaint(
        painter:PieChartPainter(slices: pieData),

              ),
            ),
      ],
    )))));
  }
}

class PieSlice {
  final double value;
  final Color color;
  final String label;

  PieSlice({required this.value, required this.color, required this.label});
}
