import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../resources/app_colors.dart';

class SyncfusionColumnChartOne extends StatefulWidget {
  const SyncfusionColumnChartOne({super.key});

  @override
  State<SyncfusionColumnChartOne> createState() => _SyncfusionColumnChartOneState();
}

class _SyncfusionColumnChartOneState extends State<SyncfusionColumnChartOne> {
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData(2010, 35, 23),
      ChartData(2011, 38, 49),
      ChartData(2012, 34, 12),
      ChartData(2013, 52, 33),
      ChartData(2014, 40, 30)
    ];

    return Center(
        child: SfCartesianChart(
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
            enableSideBySideSeriesPlacement: false,
            series: <CartesianSeries<ChartData, int>>[
          ColumnSeries<ChartData, int>(
              color: AppColors.darkGrey,
              width: 0.4,
              dataSource: chartData,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y),
          ColumnSeries<ChartData, int>(
              color: AppColors.darkBlue,
              opacity: 0.9,
              width: 0.2,
              dataSource: chartData,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y1)
        ]));
  }
}

class ChartData {
  ChartData(this.x, this.y, this.y1);
  final int x;
  final double y;
  final double y1;
}
