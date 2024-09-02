class LineChartData {
  final List<ChartPoint> points;

  LineChartData(this.points);
}

class ChartPoint {
  final double x;
  final double y;
  final String label;

  ChartPoint(this.x, this.y, this.label);
}

