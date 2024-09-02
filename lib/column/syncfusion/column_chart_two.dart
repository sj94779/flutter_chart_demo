import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../resources/app_colors.dart';

class SyncfusionColumnChartTwo extends StatefulWidget {
  const SyncfusionColumnChartTwo({super.key});

  @override
  State<SyncfusionColumnChartTwo> createState() => _SyncfusionColumnChartTwoState();
}

class _SyncfusionColumnChartTwoState extends State<SyncfusionColumnChartTwo> {
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData(1, 35.5643),
      ChartData(2, 23),
      ChartData(3, 34),
      ChartData(4, 25),
      ChartData(5, 40)
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
            primaryYAxis: NumericAxis(
                numberFormat: NumberFormat.simpleCurrency(),
                decimalPlaces: 1,
                rangePadding: ChartRangePadding.auto,
                labelStyle: const TextStyle(
                    color: AppColors.darkBlue,
                    fontSize: 12,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500)),
            axes: const <ChartAxis>[
          NumericAxis(
              majorGridLines: MajorGridLines(width: 0),
              opposedPosition: true,
              name: 'yAxis1',
              interval: 1000,
              minimum: 0,
              maximum: 7000)
        ],
            series: <CartesianSeries<ChartData, int>>[
          ColumnSeries<ChartData, int>(
              animationDuration: 1000,
              animationDelay: 2000,
              markerSettings: const MarkerSettings(isVisible: true),
              color: AppColors.darkBlue,
              width: 0.4,
              dataSource: chartData,
              // Renders the track
              isTrackVisible: false,
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
