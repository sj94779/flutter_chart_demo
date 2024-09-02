import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../resources/app_colors.dart';

class SyncfusionBubbleChartOne extends StatefulWidget {
  const SyncfusionBubbleChartOne({super.key});

  @override
  State<SyncfusionBubbleChartOne> createState() => _SyncfusionBubbleChartOneState();
}

class _SyncfusionBubbleChartOneState extends State<SyncfusionBubbleChartOne> {
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('5', 10, Colors.black, 4, Colors.red),
      ChartData('10', 5, Colors.black, 3, Colors.yellow),
      ChartData('1', 4, Colors.black, 2, Colors.green),
      ChartData('8', 15, Colors.black, 1, Colors.purple),
    ];
    return Center(
        child: SfCartesianChart(
            primaryXAxis: const CategoryAxis(
              // isInversed: true,
              labelStyle: TextStyle(
                  color: AppColors.darkBlue,
                  //  fontFamily: 'Roboto',
                  fontSize: 12,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500),
            ),
            primaryYAxis: const NumericAxis(
                labelStyle: TextStyle(
                    color: AppColors.darkBlue,
                    //  fontFamily: 'Roboto',
                    fontSize: 12,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500)),
            series: <CartesianSeries>[
          BubbleSeries<ChartData, String>(
              dataSource: chartData,
              sizeValueMapper: (ChartData data, _) => data.size,
              pointColorMapper: (ChartData data, _) => data.pointColor,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y)
        ]));
  }
}

class ChartData {
  ChartData(this.x, this.y, this.color, this.size, this.pointColor);
  final String x;
  final double y;
  final Color color;
  final double size;
  final Color pointColor;
}
