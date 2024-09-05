import 'package:flutter/material.dart';
import 'package:teste_vr_flutter/modules/dashboard/widgtets/dashboard_label.dart';

class Legend extends StatelessWidget {
  const Legend({super.key, required this.data});

  final List<(String, int, Color)> data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: data
          .map(
            (rec) => DashboardLabel(
              label: rec.$1,
              color: rec.$3,
            ),
          )
          .toList(),
    );
  }
}