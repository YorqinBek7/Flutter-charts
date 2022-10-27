import 'package:chartz/model/pupils.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Pupils> pupils = addPupils();

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white30,
        elevation: 0,
        title: const Text(
          "Pupils",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DataTable(
              columns: const [
                DataColumn(
                  label: Text("Name"),
                ),
                DataColumn(
                  label: Text("Age"),
                ),
                DataColumn(
                  label: Text("Course"),
                ),
                DataColumn(
                  label: Text("Score"),
                )
              ],
              rows: List.generate(4, (index) {
                chartData.add(
                  ChartData(
                      name: pupils[index].name,
                      percent: double.parse(pupils[index].score)),
                );
                return DataRow(cells: [
                  DataCell(
                    Text(pupils[index].name),
                  ),
                  DataCell(
                    Text(pupils[index].age),
                  ),
                  DataCell(
                    Text(pupils[index].course),
                  ),
                  DataCell(
                    Text(pupils[index].score),
                  ),
                ]);
              }),
            ),
            SfCircularChart(
              legend: Legend(
                isVisible: true,
                title: LegendTitle(
                  text: "Pupils",
                  textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                iconHeight: 40.0,
              ),
              series: List.generate(
                pupils.length,
                (index) => RadialBarSeries<ChartData, String>(
                  maximumValue: 5,
                  xValueMapper: (ChartData data, _) => data.name,
                  yValueMapper: (datum, index) => datum.percent,
                  dataSource: chartData,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
