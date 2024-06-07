import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:elementary_helper/elementary_helper.dart';
import 'package:flutter/material.dart';
import 'package:moodmaster/data/models/enums/mood_enum.dart';
import 'package:moodmaster/data/models/graphic_model/graphic_model.dart';
import 'package:moodmaster/data/models/mood/mood_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'mood_info_screen_wm.dart';

@RoutePage()
class MoodInfoScreen extends ElementaryWidget<IMoodInfoScreenWidgetModel> {
  const MoodInfoScreen({super.key}) : super(defaultMoodInfoScreenWidgetModelFactory);

  @override
  Widget build(IMoodInfoScreenWidgetModel wm) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Информация"),
        centerTitle: true,
        leading: const SizedBox(),
        actions: [IconButton(onPressed: () => wm.onClearMoodInfoTap(), icon: const Icon(Icons.delete_forever))],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            EntityStateNotifierBuilder<List<MoodModel>?>(
              listenableEntityState: wm.userMoods,
              builder: (context, List<MoodModel>? data) {
                if (data == null) return const SizedBox();
                return SizedBox(
                  width: double.infinity,
                  height: 400,
                  child: SfCircularChart(
                    title: const ChartTitle(text: 'Ваши эмоции за послендюю неделю'),
                    legend: const Legend(isVisible: true),
                    series: <PieSeries<GraphicModel, String>>[
                      PieSeries<GraphicModel, String>(
                        explode: true,
                        explodeIndex: 0,
                        dataSource: [
                          GraphicModel(
                              description: 'Хорошее настроение',
                              name: 'normal',
                              value: data.where((element) => element.mood == MoodEnum.normal).length),
                          GraphicModel(
                              description: 'Хорошее настроение',
                              name: 'happy',
                              value: data.where((element) => element.mood == MoodEnum.happy).length),
                          GraphicModel(
                              description: 'Хорошее настроение',
                              name: 'sad',
                              value: data.where((element) => element.mood == MoodEnum.sad).length),
                          GraphicModel(
                              description: 'Злое настроение',
                              name: 'angry',
                              value: data.where((element) => element.mood == MoodEnum.angry).length),
                        ],
                        xValueMapper: (GraphicModel data, _) => data.name,
                        yValueMapper: (GraphicModel data, _) => data.value,
                        dataLabelMapper: (GraphicModel data, _) => data.name,
                        dataLabelSettings: const DataLabelSettings(
                          isVisible: true,
                          labelPosition: ChartDataLabelPosition.outside,
                        ),
                      ),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
