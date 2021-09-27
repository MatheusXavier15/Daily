// ignore_for_file: file_names

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class TasksPerDay {
  final String day;
  final int doneTasks;
  final charts.Color barColor;

  TasksPerDay(
      {required this.day, required this.doneTasks, required this.barColor});
}

class TasksPerDayChart extends StatelessWidget {
  final List<TasksPerDay> data;

  const TasksPerDayChart({required this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<TasksPerDay, String>> series = [
      charts.Series(
          id: "Tasks Per Day",
          data: data,
          domainFn: (TasksPerDay series, _) => series.day,
          measureFn: (TasksPerDay series, _) => series.doneTasks,
          colorFn: (TasksPerDay series, _) => series.barColor)
    ];
    return Container(
      height: 300,
      padding: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Text(
              "Tarefas cumpridas na semana",
              style: Theme.of(context).textTheme.bodyText2,
            ),
            Expanded(
              child: charts.BarChart(series, animate: true),
            )
          ],
        ),
      ),
    );
  }
}
