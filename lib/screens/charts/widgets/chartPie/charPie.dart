// ignore_for_file: file_names

import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class GaugeSegment {
  final String segment;
  final int size;
  final charts.Color barColor;

  GaugeSegment(this.segment, this.size, this.barColor);
}

class GaugeChart extends StatelessWidget {
  final List<GaugeSegment> data;

  const GaugeChart({required this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<GaugeSegment, String>> series = [
      charts.Series(
          id: "Tasks Per Day",
          data: data,
          domainFn: (GaugeSegment series, _) => series.segment,
          measureFn: (GaugeSegment series, _) => series.size,
          colorFn: (GaugeSegment series, _) => series.barColor)
    ];
    return Container(
      height: 300,
      padding: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Text(
              "Tarefas cumpridas por dia",
              style: Theme.of(context).textTheme.bodyText2,
            ),
            Expanded(
              child: charts.PieChart<String>(
                series,
                animate: true,
                defaultRenderer: charts.ArcRendererConfig(arcWidth: 35),
              ),
            )
          ],
        ),
      ),
    );
  }
}
