import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../data/source/mood_rds/mood_rds.dart';
import 'mood_info_screen_wm.dart';

@RoutePage()
class MoodInfoScreen extends ElementaryWidget<IMoodInfoScreenWidgetModel> {
  const MoodInfoScreen({super.key})
      : super(defaultMoodInfoScreenWidgetModelFactory);

  @override
  Widget build(IMoodInfoScreenWidgetModel wm) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Информация"),
        centerTitle: true,
        leading: const SizedBox(),
        actions: [
          IconButton(
              onPressed: () => wm.onClearMoodInfoTap(),
              icon: const Icon(Icons.delete_forever))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: double.infinity,
            height: 400,
            child: SfCircularChart(
              title: const ChartTitle(text: 'Ваши эмоции за послендюю неделю'),
              legend: const Legend(isVisible: true),
              series: <PieSeries<PieData, String>>[
                PieSeries<PieData, String>(
                    explode: true,
                    explodeIndex: 0,
                    dataSource: pieData,
                    xValueMapper: (PieData data, _) => data.xData,
                    yValueMapper: (PieData data, _) => data.yData,
                    dataLabelMapper: (PieData data, _) => data.text,
                    dataLabelSettings: const DataLabelSettings(
                      isVisible: true,
                      labelPosition: ChartDataLabelPosition.outside,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
