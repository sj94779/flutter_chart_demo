

class BarChartData {
  final List<ChartBar> bars;

  BarChartData(this.bars);
}

class ChartBar {
  final double x;
  final double y;
  final double height;
  final String label;

  ChartBar(this.x, this.y, this.height, this.label);
}