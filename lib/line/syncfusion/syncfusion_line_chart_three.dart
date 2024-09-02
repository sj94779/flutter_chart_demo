import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../resources/app_colors.dart';

class SyncfusionLineChartThree extends StatefulWidget {
  const SyncfusionLineChartThree({super.key});

  @override
  State<SyncfusionLineChartThree> createState() =>
      _SyncfusionLineChartThreeState();
}

class _SyncfusionLineChartThreeState extends State<SyncfusionLineChartThree> {
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
            primaryXAxis: const NumericAxis(
              opposedPosition: true,
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
              color: AppColors.darkBlue,
              dataSource: chartData,
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
