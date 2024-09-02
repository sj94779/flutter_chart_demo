import 'package:flutter/material.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;
import '../../resources/app_colors.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class SyncfusionScatterChartOne extends StatefulWidget {
  const SyncfusionScatterChartOne({super.key});

  @override
  State<SyncfusionScatterChartOne> createState() =>
      _SyncfusionScatterChartOneState();
}

class _SyncfusionScatterChartOneState extends State<SyncfusionScatterChartOne> {
  late GlobalKey<SfCartesianChartState> _cartesianChartKey;

  @override
  void initState() {
    _cartesianChartKey = GlobalKey();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData(DateTime(2010), 32),
      ChartData(DateTime(2011), 40),
      ChartData(DateTime(2012), 34),
      ChartData(DateTime(2013), 52),
      ChartData(DateTime(2014), 42),
      ChartData(DateTime(2015), 38),
      ChartData(DateTime(2016), 41),
    ];
    return Center(
        child: Column(
      children: [
        SfCartesianChart(
            key: _cartesianChartKey,
            primaryYAxis: const NumericAxis(
                axisBorderType: AxisBorderType.rectangle,
                majorGridLines: MajorGridLines(
                    width: 1, color: Colors.red, dashArray: <double>[5, 5]),
                minorGridLines: MinorGridLines(
                    width: 1, color: Colors.green, dashArray: <double>[5, 5]),
                minorTicksPerInterval: 2,
                labelStyle: TextStyle(
                    color: AppColors.darkBlue,
                    //  fontFamily: 'Roboto',
                    fontSize: 12,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500)),
            primaryXAxis: DateTimeAxis(
              plotBands: <PlotBand>[
                PlotBand(
                    isVisible: true,
                    isRepeatable: true,
                    repeatEvery: 2,
                    size: 1,
                    sizeType: DateTimeIntervalType.years,
                    repeatUntil: DateTime(2018, 6, 1),
                    color: const Color.fromRGBO(224, 155, 0, 1)),
              ],
              plotOffset: 20,
              labelPosition: ChartDataLabelPosition.inside,
              tickPosition: TickPosition.inside,
              edgeLabelPlacement: EdgeLabelPlacement.shift,
              title: const AxisTitle(
                text: 'X-Axis',
                textStyle: TextStyle(
                    color: AppColors.darkBlue,
                    fontFamily: 'Roboto',
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w300),
              ),
              labelStyle: const TextStyle(
                  color: AppColors.darkBlue,
                  //  fontFamily: 'Roboto',
                  fontSize: 12,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500),
            ),
            series: <CartesianSeries>[
              ScatterSeries<ChartData, DateTime>(
                  color: AppColors.darkBlue,
                  dataSource: chartData,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y,
                  markerSettings: const MarkerSettings(
                      height: 15,
                      width: 15,
                      // Scatter will render in diamond shape
                      shape: DataMarkerType.diamond))
            ]),
        TextButton(
          child: const Text('Export as image'),
          onPressed: () {
            _renderChartAsImage();
          },
        ),
      ],
    ));
  }

  Future<void> _renderChartAsImage() async {
    final ui.Image? data =
        await _cartesianChartKey.currentState!.toImage(pixelRatio: 3.0);
    final ByteData? bytes =
        await data?.toByteData(format: ui.ImageByteFormat.png);
    final Uint8List imageBytes =
        bytes!.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);

    //
    Uint8List imageInUnit8List = imageBytes; // store unit8List image here ;
    final tempDir = await getApplicationDocumentsDirectory();
    File file = await File('${tempDir.path}/image.png').create();

    file.writeAsBytesSync(imageInUnit8List);
    print("filepath: ${file.path}");

    await Navigator.of(context).push<dynamic>(
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) {
          return Scaffold(
              body: Center(
            child: SizedBox(
              width: 300,
              height: 300,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    OpenFile.open(file.path);
                  });
                },
                child: Text(
                  "Open",
                  style: TextStyle(
                    color: Colors.blue[200],
                  ),
                ),
              ),
            ),
          ));
        },
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final DateTime x;
  final double y;
}
