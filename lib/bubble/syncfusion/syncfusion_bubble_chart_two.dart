import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../resources/app_colors.dart';

class SyncfusionBubbleChartTwo extends StatefulWidget {
  const SyncfusionBubbleChartTwo({super.key});

  @override
  State<SyncfusionBubbleChartTwo> createState() => _SyncfusionBubbleChartTwoState();
}

class _SyncfusionBubbleChartTwoState extends State<SyncfusionBubbleChartTwo> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SfCartesianChart(
            primaryXAxis: const NumericAxis(
              isInversed: true,
              majorTickLines:
                  MajorTickLines(size: 6, width: 2, color: Colors.red),
              minorTickLines:
                  MinorTickLines(size: 4, width: 2, color: Colors.blue),
              minorTicksPerInterval: 2,
              labelStyle: TextStyle(
                  color: AppColors.darkBlue,
                  //  fontFamily: 'Roboto',
                  fontSize: 12,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500),
            ),
            primaryYAxis: const NumericAxis(
                initialVisibleMaximum: 6,
                labelStyle: TextStyle(
                    color: AppColors.darkBlue,
                    //  fontFamily: 'Roboto',
                    fontSize: 12,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500)),
            series: <CartesianSeries>[
          BubbleSeries<ChartData, num>(
              dataSource: <ChartData>[
                ChartData('US', 99.4, 2.2, 0.312),
                ChartData('Mexico', 86.1, 4.0, 0.115)
              ],
              xValueMapper: (ChartData data, _) => data.xValue,
              yValueMapper: (ChartData data, _) => data.y,
              sizeValueMapper: (ChartData data, _) => data.size),
          BubbleSeries<ChartData, num>(
              dataSource: <ChartData>[
                ChartData('Germany', 99, 0.7, 0.0818),
                ChartData('Russia', 99.6, 3.4, 0.143),
                ChartData('Netherland', 79.2, 3.9, 0.162)
              ],
              xValueMapper: (ChartData data, _) => data.xValue,
              yValueMapper: (ChartData data, _) => data.y,
              sizeValueMapper: (ChartData data, _) => data.size),
          BubbleSeries<ChartData, num>(
              dataSource: <ChartData>[
                ChartData('China', 92.2, 7.8, 1.347),
                ChartData('India', 74, 6.5, 1.241),
                ChartData('Indonesia', 90.4, 6.0, 0.238),
                ChartData('Japan', 99, 0.2, 0.128),
                ChartData('Philippines', 92.6, 6.6, 0.096),
                ChartData('Hong Kong', 82.2, 3.97, 0.7),
                ChartData('Jordan', 72.5, 4.5, 0.7),
                ChartData('Australia', 81, 3.5, 0.21),
                ChartData('Mongolia', 66.8, 3.9, 0.028),
                ChartData('Taiwan', 78.4, 2.9, 0.231),
              ],
              xValueMapper: (ChartData data, _) => data.xValue,
              yValueMapper: (ChartData data, _) => data.y,
              sizeValueMapper: (ChartData data, _) => data.size),
          BubbleSeries<ChartData, num>(
              dataSource: <ChartData>[
                ChartData('Egypt', 72, 2.0, 0.0826),
                ChartData('Nigeria', 61.3, 1.45, 0.162),
              ],
              xValueMapper: (ChartData data, _) => data.xValue,
              yValueMapper: (ChartData data, _) => data.y,
              sizeValueMapper: (ChartData data, _) => data.size),
        ]));
  }
}

class ChartData {
  ChartData(this.x, this.xValue, this.y, this.size);
  final String x;
  final double xValue;
  final double y;
  final double size;
}
