import 'package:flutter/material.dart';
import 'package:flutter_chart_demo/pie/custom_without_dependency/custom_pie_chart_screen.dart';
import 'package:flutter_chart_demo/pie/fl_chart/fl_pie_chart_screen.dart';
import 'package:flutter_chart_demo/resources/app_colors.dart';
import 'package:flutter_chart_demo/scatter/custom_without_dependency/custom_scatter_chart_screen.dart';
import 'package:flutter_chart_demo/scatter/fl_charts/fl_scatter_chart_screen.dart';
import 'package:flutter_chart_demo/scatter/syncfusion/syncfusion_scatter_chart_screen.dart';
import 'bar/custom_without_dependency/custom_bar_chart.dart';
import 'bar/fl_charts/fl_bar_chart_screen.dart';
import 'bar/syncfusion/syncfusion_bar_chart_screen.dart';
import 'bubble/custom_without_dependency/custom_bubble_chart_screen.dart';
import 'bubble/fl_chart/fl_bubble_chart_screen.dart';
import 'bubble/syncfusion/syncfusion_bubble_chart_screen.dart';
import 'column/custom_without_dependency/custom_column_chart_screen.dart';
import 'column/syncfusion/syncfusion_column_chart_screen.dart';
import 'line/custom_without_dependency/custom_line_chart_screen.dart';
import 'line/fl_charts/fl_line_chart_screen.dart';
import 'line/syncfusion/syncfusion_line_chart_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chart Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Chart Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.darkBlue,
        title: Text(
          widget.title,
          style: TextStyle(color: AppColors.contentColorWhite),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 30,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const flLineChartScreen()));
                  },
                  child: const Text(
                    "fl Line Chart",
                    style: TextStyle(color: AppColors.darkBlue),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const flBarChartScreen()));
                  },
                  child: const Text(
                    "fl Bar Chart",
                    style: TextStyle(color: AppColors.darkBlue),
                  )),

              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const flScatterChartScreen()));
                  },
                  child: const Text(
                    "fl Scatter Chart",
                    style: TextStyle(color: AppColors.darkBlue),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const flBubbleChartScreen()));
                  },
                  child: const Text(
                    "fl Bubble Chart",
                    style: TextStyle(color: AppColors.darkBlue),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const flPieChartScreen()));
                  },
                  child: const Text(
                    "fl Pie Chart",
                    style: TextStyle(color: AppColors.darkBlue),
                  )),
              SizedBox(height: 30,),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const CustomLineChart()));
                  },
                  child: const Text(
                    "Custom Line Chart",
                    style: TextStyle(color: AppColors.darkBlue),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const CustomBarChart()));
                  },
                  child: const Text(
                    "Custom Bar Chart",
                    style: TextStyle(color: AppColors.darkBlue),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const CustomColumnChart()));
                  },
                  child: const Text(
                    "Custom Column Chart",
                    style: TextStyle(color: AppColors.darkBlue),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const CustomScatterChartScreen()));
                  },
                  child: const Text(
                    "Custom Scatter Chart",
                    style: TextStyle(color: AppColors.darkBlue),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const CustomBubbleChartScreen()));
                  },
                  child: const Text(
                    "Custom Bubble Chart",
                    style: TextStyle(color: AppColors.darkBlue),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const CustomPieChartScreen()));
                  },
                  child: const Text(
                    "Custom Pie Chart",
                    style: TextStyle(color: AppColors.darkBlue),
                  )),
              SizedBox(height: 30,),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SyncfusionLineChartScreen()));
                  },
                  child: const Text(
                    "Syncfusion Line Chart",
                    style: TextStyle(color: AppColors.darkBlue),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SyncfusionBarChartScreen()));
                  },
                  child: const Text(
                    "Syncfusion Bar Chart",
                    style: TextStyle(color: AppColors.darkBlue),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SyncfusionColumnChartScreen()));
                  },
                  child: const Text(
                    "Syncfusion Column Chart",
                    style: TextStyle(color: AppColors.darkBlue),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                        const SyncfusionScatterChartScreen()));
                  },
                  child: const Text(
                    "Syncfusion Scatter Chart",
                    style: TextStyle(color: AppColors.darkBlue),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SyncfusionBubbleChartScreen()));
                  },
                  child: const Text(
                    "Syncfusion Bubble Chart",
                    style: TextStyle(color: AppColors.darkBlue),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
