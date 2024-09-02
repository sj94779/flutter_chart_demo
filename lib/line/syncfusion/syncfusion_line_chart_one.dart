import 'package:flutter/material.dart';
import 'package:flutter_chart_demo/resources/app_colors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SyncfusionLineChartOne extends StatefulWidget {
  const SyncfusionLineChartOne({super.key});

  @override
  State<SyncfusionLineChartOne> createState() => _SyncfusionLineChartOneState();
}

class _SyncfusionLineChartOneState extends State<SyncfusionLineChartOne> {
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData(2010, 35),
      ChartData(2011, 28),
      ChartData(2012, 34),
      ChartData(2013, 32),
      ChartData(2014, 40)
    ];
    return Center(
        child: SfCartesianChart(
            legend: const Legend(isVisible: true),
            primaryXAxis: const NumericAxis(
              labelStyle: TextStyle(
                  color: AppColors.darkBlue,
                  fontSize: 12,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500),
            ),
            primaryYAxis: const NumericAxis(
                labelStyle: TextStyle(
                    color: AppColors.darkBlue,
                    fontSize: 12,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500)),
            series: <CartesianSeries>[
          LineSeries<ChartData, int>(
              dataLabelSettings: const DataLabelSettings(
                  color: AppColors.darkBlue, isVisible: true),
              dataSource: chartData,
              color: AppColors.darkBlue,
              // Dash values for line
              dashArray: const <double>[5, 5],
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y)
        ]));
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final int x;
  final double y;
}
