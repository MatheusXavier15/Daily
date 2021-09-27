import 'package:Daily/screens/charts/widgets/chartBar/ChartBar.dart';
import 'package:Daily/screens/charts/widgets/chartPie/charPie.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

import '../../constants.dart';

class Charts extends StatelessWidget {
  Charts({Key? key}) : super(key: key);
  final List<TasksPerDay> dataBar = [
    TasksPerDay(
        day: "Seg",
        doneTasks: 10,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    TasksPerDay(
        day: "Ter",
        doneTasks: 8,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    TasksPerDay(
        day: "Qua",
        doneTasks: 15,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    TasksPerDay(
        day: "Qui",
        doneTasks: 9,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    TasksPerDay(
        day: "Sex",
        doneTasks: 12,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    TasksPerDay(
        day: "Sab",
        doneTasks: 6,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    TasksPerDay(
        day: "Dom",
        doneTasks: 3,
        barColor: charts.ColorUtil.fromDartColor(Colors.blue))
  ];
  final List<GaugeSegment> dataGauge = [
    GaugeSegment("Done", 77, charts.ColorUtil.fromDartColor(Colors.lightBlue)),
    GaugeSegment("did", 33, charts.ColorUtil.fromDartColor(Colors.transparent)),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Estatísticas",
                style: TextStyle(
                    color: bottomBarBackground,
                    fontSize: 25,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 90,
                child: Divider(
                  color: bottomBarBackground,
                  thickness: 1,
                ),
              )
            ],
          ),
        ),
        GaugeChart(data: dataGauge),
        TasksPerDayChart(data: dataBar)
      ],
    );
  }
}
