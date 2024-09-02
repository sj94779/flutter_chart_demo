import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../resources/app_colors.dart';

class SyncfusionBarChartOne extends StatefulWidget {
  const SyncfusionBarChartOne({super.key});

  @override
  State<SyncfusionBarChartOne> createState() => _SyncfusionBarChartOneState();
}

class _SyncfusionBarChartOneState extends State<SyncfusionBarChartOne> {
  @override
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData(1, 35),
      ChartData(2, 23),
      ChartData(3, 34),
      ChartData(4, 25),
      ChartData(5, 40)
    ];
    return Center(
        child: SfCartesianChart(
            enableAxisAnimation: true,
            primaryXAxis: const NumericAxis(
              labelFormat: '{value}°C',
              labelStyle: TextStyle(
                  color: AppColors.darkBlue,
                  fontSize: 12,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500),
            ),
            primaryYAxis: const NumericAxis(
                plotOffset: 20,
                labelStyle: TextStyle(
                    color: AppColors.darkBlue,
                    fontSize: 12,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500)),
            series: <CartesianSeries>[
          BarSeries<ChartData, double>(
              width: 0.4,
              color: AppColors.darkBlue,
              dataSource: chartData,
              // Renders the track
              isTrackVisible: true,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y)
        ]));
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final double x;
  final double y;
}
