import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../resources/app_colors.dart';

class SyncfusionLineChartTwo extends StatefulWidget {
  const SyncfusionLineChartTwo({super.key});

  @override
  State<SyncfusionLineChartTwo> createState() => _SyncfusionLineChartTwoState();
}

class _SyncfusionLineChartTwoState extends State<SyncfusionLineChartTwo> {
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SfCartesianChart(
            title: const ChartTitle(
                text: 'Half yearly sales analysis',
                textStyle: TextStyle(
                  color: AppColors.darkBlue,
                  fontFamily: 'Roboto',
                  fontStyle: FontStyle.italic,
                  fontSize: 14,
                )),
            tooltipBehavior: _tooltipBehavior,
            primaryXAxis: const CategoryAxis(
              maximumLabelWidth: 70,
              labelRotation: 90,
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
          LineSeries<ChartData, String>(
              dataSource: [
                ChartData('Jan', 35, Colors.red),
                ChartData('Feb', 28, Colors.green),
                ChartData('Mar', 34, Colors.blue),
                ChartData('Apr', 32, Colors.pink),
                ChartData('May', 40, Colors.black)
              ],
              pointColorMapper: (ChartData data, _) => data.color,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y)
        ]));
  }
}

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}
