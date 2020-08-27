import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ChartPage extends StatelessWidget {

final List<charts.Series> seriesList;
  final bool animate;

  ChartPage(this.seriesList, {this.animate});

/// Creates a [TimeSeriesChart] with sample data and no transition.
  factory ChartPage.withSampleData() {
    return new ChartPage(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }
  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      seriesList,
      animate: animate,
      // Optionally pass in a [DateTimeFactory] used by the chart. The factory
      // should create the same type of [DateTime] as the data provided. If none
      // specified, the default creates local date time.
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final data = [
      new OrdinalSales('Monday', 5),
      new OrdinalSales('Tuesday', 10),
      new OrdinalSales('Wednesday', 15),
      new OrdinalSales('Thursday', 25),
      new OrdinalSales('Friday', 30),
      new OrdinalSales('Saturday', 20),
      new OrdinalSales('Sunday', 15),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }


}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
