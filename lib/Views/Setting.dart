import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:iaxpp/Models/Subscribers.dart';

class Setting extends StatefulWidget {
  Setting({Key key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final List<SubscriberSeries> data = [
    SubscriberSeries(
      year: "2008",
      subscribers: 10000000,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    SubscriberSeries(
      year: "2009",
      subscribers: 11000000,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    SubscriberSeries(
      year: "2010",
      subscribers: 12000000,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    SubscriberSeries(
      year: "2011",
      subscribers: 10000000,
      barColor: charts.ColorUtil.fromDartColor(Colors.grey),
    ),
    SubscriberSeries(
      year: "2012",
      subscribers: 8500000,
      barColor: charts.ColorUtil.fromDartColor(Colors.amber),
    ),
    SubscriberSeries(
      year: "2013",
      subscribers: 2600665,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    SubscriberSeries(
      year: "2014",
      subscribers: 7600000,
      barColor: charts.ColorUtil.fromDartColor(Colors.deepOrangeAccent),
    ),
    SubscriberSeries(
      year: "2015",
      subscribers: 5500000,
      barColor: charts.ColorUtil.fromDartColor(Colors.red),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    List<charts.Series<SubscriberSeries, String>> series = [
      charts.Series(
          id: "Subscribers",
          data: data,
          domainFn: (SubscriberSeries series, _) => series.year,
          measureFn: (SubscriberSeries series, _) => series.subscribers,
          colorFn: (SubscriberSeries series, _) => series.barColor)
    ];
//
    return new Scaffold(
      appBar: AppBar(),
      drawer: _staticSubscrib(series),
      body: ListView(
        children: [_cards(series)],
      ),
    );
  }

  _staticSubscrib(series) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 300,
          height: 300,
          child: charts.BarChart(series, animate: true),
        ),
        Container(
          width: 300,
          height: 300,
          child: charts.BarChart(series, animate: true),
        ),
        Container(
          width: 300,
          height: 300,
          child: charts.BarChart(series, animate: true),
        )
      ],
    );
  }

  _cards(series) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 400,
          height: 400,
          child: Card(
              elevation: 10,
              child: Column(
                children: [
                  Text("Nivel de likes  "),
                  Container(
                    width: 300,
                    height: 300,
                    child: charts.BarChart(series, animate: true),
                  )
                ],
              )),
        ),
        Container(
          width: 400,
          height: 400,
          child: Card(
              elevation: 10,
              child: Column(
                children: [
                  Text("Nivel de escribtores "),
                  Container(
                    width: 300,
                    height: 300,
                    child: charts.BarChart(series, animate: true),
                  )
                ],
              )),
        ),
        Container(
          width: 400,
          height: 400,
          child: Card(
              elevation: 10,
              child: Column(
                children: [
                  Text("Nivel de Visualizaciones "),
                  Container(
                    width: 300,
                    height: 300,
                    child: charts.BarChart(series, animate: true),
                  )
                ],
              )),
        ),
      ],
    );
  }
}
