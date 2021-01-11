
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: FirstRoute(),
  ));
}

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('데모'),
      ),
      body: Center(
        child: Column(children:<Widget>[
          ElevatedButton(
            child: Text('코로나 예제'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CoronaRoute()),
              );
            },
          ),
          ElevatedButton(
              onPressed: (){

              },
              child: Text('예제2'),
          ),
        ]
        ),
      ),
    );
  }
}

class CoronaRoute extends StatefulWidget {

  CoronaRoute({Key key}) : super(key: key);

  @override
  _CoronaRouteState createState() => _CoronaRouteState();
}


/// This is the private State class that goes with MyStatefulWidget.
class _CoronaRouteState extends State<CoronaRoute> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
  Scrollbar(child:SingleChildScrollView(
    child:Align(
        alignment: Alignment.topCenter,
        child: DataTable(
            columns: [
              DataColumn(label: Text('이름')),
              DataColumn(label: Text('출생년도'), numeric: true),
              DataColumn(label: Text('성별')),
              DataColumn(label: Text('최종학력')),
              DataColumn(label: Text('고향')),
            ],
            rows: [
              DataRow(cells: [
                DataCell(Text('철수2')),
                DataCell(Text('1977')),
                DataCell(Text('남')),
                DataCell(Text('학사')),
                DataCell(Text('부산')),
              ]),
              DataRow(cells: [
                DataCell(Text('철수')),
                DataCell(Text('1977')),
                DataCell(Text('남')),
                DataCell(Text('학사')),
                DataCell(Text('부산')),
              ]),
              DataRow(cells: [
                DataCell(Text('철수')),
                DataCell(Text('1977')),
                DataCell(Text('남')),
                DataCell(Text('학사')),
                DataCell(Text('부산')),
              ]),
              DataRow(cells: [
                DataCell(Text('철수')),
                DataCell(Text('1977')),
                DataCell(Text('남')),
                DataCell(Text('학사')),
                DataCell(Text('부산')),
              ]),
              DataRow(cells: [
                DataCell(Text('철수')),
                DataCell(Text('1977')),
                DataCell(Text('남')),
                DataCell(Text('학사')),
                DataCell(Text('부산')),
              ]),
              DataRow(cells: [
                DataCell(Text('철수')),
                DataCell(Text('1977')),
                DataCell(Text('남')),
                DataCell(Text('학사')),
                DataCell(Text('부산')),
              ]),
              DataRow(cells: [
                DataCell(Text('철수')),
                DataCell(Text('1977')),
                DataCell(Text('남')),
                DataCell(Text('학사')),
                DataCell(Text('부산')),
              ]),
              DataRow(cells: [
                DataCell(Text('철수')),
                DataCell(Text('1977')),
                DataCell(Text('남')),
                DataCell(Text('학사')),
                DataCell(Text('부산')),
              ]),
              DataRow(cells: [
                DataCell(Text('철수')),
                DataCell(Text('1977')),
                DataCell(Text('남')),
                DataCell(Text('학사')),
                DataCell(Text('부산')),
              ]),
              DataRow(cells: [
                DataCell(Text('철수')),
                DataCell(Text('1977')),
                DataCell(Text('남')),
                DataCell(Text('학사')),
                DataCell(Text('부산')),
              ]),
              DataRow(cells: [
                DataCell(Text('철수')),
                DataCell(Text('1977')),
                DataCell(Text('남')),
                DataCell(Text('학사')),
                DataCell(Text('부산')),
              ]),
              DataRow(cells: [
                DataCell(Text('철수')),
                DataCell(Text('1977')),
                DataCell(Text('남')),
                DataCell(Text('학사')),
                DataCell(Text('부산')),
              ]),
              DataRow(cells: [
                DataCell(Text('철수')),
                DataCell(Text('1977')),
                DataCell(Text('남')),
                DataCell(Text('학사')),
                DataCell(Text('부산')),
              ]),
              DataRow(cells: [
                DataCell(Text('철수')),
                DataCell(Text('1977')),
                DataCell(Text('남')),
                DataCell(Text('학사')),
                DataCell(Text('부산')),
              ]),
              DataRow(cells: [
                DataCell(Text('영희')),
                DataCell(Text('1981')),
                DataCell(Text('여')),
                DataCell(Text('석사')),
                DataCell(Text('서울')),
              ])
            ]
          )
        )
  )),
    SimpleTimeSeriesChart.withSampleData(),

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Corona 예제'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.table_view),
            label: '표',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart),
            label: 'Chart',
          ),

        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

class SimpleTimeSeriesChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  SimpleTimeSeriesChart(this.seriesList, {this.animate});

  /// Creates a [TimeSeriesChart] with sample data and no transition.
  factory SimpleTimeSeriesChart.withSampleData() {
    return new SimpleTimeSeriesChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }


  @override
  Widget build(BuildContext context) {
    return new charts.TimeSeriesChart(
      seriesList,
      animate: animate,
      // Optionally pass in a [DateTimeFactory] used by the chart. The factory
      // should create the same type of [DateTime] as the data provided. If none
      // specified, the default creates local date time.
      dateTimeFactory: const charts.LocalDateTimeFactory(),
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<TimeSeriesSales, DateTime>> _createSampleData() {
    final data = [
      new TimeSeriesSales(new DateTime(2017, 9, 19), 5),
      new TimeSeriesSales(new DateTime(2017, 9, 26), 25),
      new TimeSeriesSales(new DateTime(2017, 10, 3), 100),
      new TimeSeriesSales(new DateTime(2017, 10, 10), 75),
    ];

    return [
      new charts.Series<TimeSeriesSales, DateTime>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

/// Sample time series data type.
class TimeSeriesSales {
  final DateTime time;
  final int sales;

  TimeSeriesSales(this.time, this.sales);
}