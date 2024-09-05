import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:teste_vr_flutter/modules/dashboard/widgtets/legend.dart';

class Chart extends StatelessWidget {
  const Chart({
    super.key,
    required this.data,
    required this.orientation,
  });

  final List<(String, int, Color)> data;
  final Axis orientation;

  @override
  Widget build(BuildContext context) {
    final isSmall = MediaQuery.of(context).size.width < 700;

    return orientation == Axis.horizontal
        ? Expanded(
            child: Row(
              children: [
                Legend(data: data),
                const SizedBox(width: 50),
                SizedBox(
                  height: 200,
                  width: 100,
                  child: AspectRatio(
                    aspectRatio: 1 / 2,
                    child: PieChart(
                      PieChartData(
                        centerSpaceRadius: isSmall ? 20 : 40,
                        sections: data
                            .map(
                              (rec) => PieChartSectionData(
                                value: rec.$2.toDouble(),
                                color: rec.$3,
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                ),
                if (!isSmall) const Spacer(),
              ],
            ),
          )
        : Column(
            children: [
              Legend(data: data),
              const SizedBox(height: 10),
              SizedBox(
                height: 200,
                width: 100,
                child: AspectRatio(
                  aspectRatio: 1 / 2,
                  child: PieChart(
                    PieChartData(
                      centerSpaceRadius: isSmall ? 20 : 40,
                      sections: data
                          .map(
                            (rec) => PieChartSectionData(
                              value: rec.$2.toDouble(),
                              color: rec.$3,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ),
            ],
          );
  }
}



