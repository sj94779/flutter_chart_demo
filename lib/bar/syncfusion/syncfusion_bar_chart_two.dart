import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../resources/app_colors.dart';

class SyncfusionBarChartTwo extends StatefulWidget {
  const SyncfusionBarChartTwo({super.key});

  @override
  State<SyncfusionBarChartTwo> createState() => _SyncfusionBarChartTwoState();
}

class _SyncfusionBarChartTwoState extends State<SyncfusionBarChartTwo> {
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
            primaryXAxis: const NumericAxis(
              autoScrollingDelta: 6,
              autoScrollingMode: AutoScrollingMode.start,
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
            isTransposed: true, // true for verticle
            series: <CartesianSeries>[
          BarSeries<ChartData, double>(
              width: 0.4,
              color: AppColors.darkBlue,
              dataSource: chartData,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
              borderRadius: const BorderRadius.all(Radius.circular(15)))
        ]));
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final double x;
  final double y;
}
