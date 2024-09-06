import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:teste_vr_flutter/modules/dashboard/dashboard_controller.dart';
import 'package:teste_vr_flutter/modules/dashboard/widgtets/chart.dart';
import 'package:teste_vr_flutter/modules/dashboard/widgtets/dashboard_header_card.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});

  final controller = Modular.get<DashboardController>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    final theme = Theme.of(context);
    final isSmall = width < 700;

    // Dados dos gráficos
    final chartData = [
      ("Alunos Matriculados", 10, Colors.tealAccent),
      ("Alunos Não Matriculados", 1, Colors.black),
    ];

    final chart2Data = [
      (
        "ReactJs",
        1,
        Colors.primaries[Random().nextInt(Colors.primaries.length)]
      ),
      ("Go", 2, Colors.primaries[Random().nextInt(Colors.primaries.length)]),
      ("C#", 4, Colors.primaries[Random().nextInt(Colors.primaries.length)]),
      ("C#", 2, Colors.primaries[Random().nextInt(Colors.primaries.length)]),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Dashboard",
          style: theme.textTheme.titleLarge,
        ),
        centerTitle: isSmall,
      ),
      body: Container(
        padding: EdgeInsets.only(
          right: 16,
          top: 16,
          left: width < 700 ? 16 : 0,
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DashboardHeaderCard(
                    title: "Total Students",
                    data: NumberFormat("#,##0").format(1000),
                  ),
                  const SizedBox(width: 20),
                  DashboardHeaderCard(
                    title: "Total Courses",
                    data: NumberFormat("#,##0").format(9),
                  ),
                  const SizedBox(width: 20),
                  DashboardHeaderCard(
                    title: "Total Enrolments",
                    data: NumberFormat("#,##0").format(2000),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Container(
                width: width * (isSmall ? 1 : 0.8),
                height: width < 1000 ? height * 0.7 : height * 0.5,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[300] ?? Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: LayoutBuilder(builder: (context, constraints) {
                  bool isNarrow = constraints.maxWidth < 1100;

                  return isNarrow
                      ? SingleChildScrollView(
                          child: Column(
                            children: [
                              Chart(
                                data: chartData,
                                orientation: Axis.vertical,
                              ),
                              const SizedBox(height: 16),
                              Chart(
                                data: chart2Data,
                                orientation: Axis.vertical,
                              ),
                            ],
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Chart(
                              data: chartData,
                              orientation: Axis.horizontal,
                            ),
                            Chart(
                              data: chart2Data,
                              orientation: Axis.horizontal,
                            ),
                          ],
                        );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
