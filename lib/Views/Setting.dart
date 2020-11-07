import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:iaxpp/Models/Subscribers.dart';
import 'package:iaxpp/Views/Menu.dart';

class Setting extends StatefulWidget {
  Setting({Key key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final List<SubscriberSeries> data = [
    SubscriberSeries(
      year: "2008",
      subscribers: 300000,
      barColor: charts.ColorUtil.fromDartColor(Colors.brown),
    ),
    SubscriberSeries(
      year: "2009",
      subscribers: 11000000,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    SubscriberSeries(
      year: "2010",
      subscribers: 12000000,
      barColor: charts.ColorUtil.fromDartColor(Colors.cyanAccent),
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
      drawer: Menu(),
      body: ListView(
        children: [
          _cards(series),
          SizedBox(
            height: 40,
          ),
          _staticSubscrib(series),
        ],
      ),
    );
  }

  _staticSubscrib(series) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 250,
          child: charts.PieChart(
            series,
            animate: true,
            selectionModels: [
              new charts.SelectionModelConfig(
                  type: charts.SelectionModelType.info,
                  updatedListener: _infoSelectionModelUpdated)
            ],
          ),
        ),
        Container(
          width: 250,
          child: charts.BarChart(
            series,
            animate: true,
            animationDuration: Duration(
              seconds: 5,
            ),
            behaviors: [
              charts.DatumLegend(
                  outsideJustification: charts.OutsideJustification.endDrawArea,
                  horizontalFirst: false,
                  desiredMaxRows: 2,
                  entryTextStyle: charts.TextStyleSpec(
                      color: charts.MaterialPalette.deepOrange.shadeDefault)),
            ],
          ),
        ),
      ],
    );
  }

  _cards(series) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 250,
          child: Card(
              elevation: 10,
              child: Column(
                children: [
                  Text("Nivel de likes  "),
                  Container(
                    width: 250,
                    height: 250,
                    child: charts.BarChart(
                      series,
                      animate: true,
                      animationDuration: Duration(
                        seconds: 3,
                      ),
                      behaviors: [
                        charts.DatumLegend(
                            outsideJustification:
                                charts.OutsideJustification.endDrawArea,
                            horizontalFirst: false,
                            desiredMaxRows: 2)
                      ],
                    ),
                  ),
                ],
              )),
        ),
        Container(
          width: 250,
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
          width: 250,
          child: Card(
              elevation: 10,
              child: Column(
                children: [
                  Text("Nivel de Visualizaciones "),
                  Container(
                    color: Colors.limeAccent,
                    width: 300,
                    height: 300,
                    child: charts.PieChart(series,
                        animate: true,
                        defaultRenderer: new charts.ArcRendererConfig(
                            arcWidth: 45,
                            startAngle: 4 / 5 * 250,
                            arcLength: 7 / 5 * 20)),
                  ),
                  _crearDropDown()
                ],
              )),
        ),
      ],
    );
  }

  void _infoSelectionModelUpdated(charts.SelectionModel model) {}
  List<String> _opciones = ["ver videos", "radios", "chat"];
  List<DropdownMenuItem<String>> getopciones() {
    List<DropdownMenuItem<String>> lista = new List();
    _opciones.forEach((opcion) {
      lista.add(DropdownMenuItem(
        child: Text(opcion),
        value: opcion,
      ));
    });
    return lista;
  }

  String opcionSelecionada = "chat";
  _crearDropDown() {
    return DropdownButton(
      items: getopciones(),
      value: opcionSelecionada,
      onChanged: (opt) {
        print(opt);
        setState(() {
          opcionSelecionada = opt;
        });
      },
    );
  }
}
