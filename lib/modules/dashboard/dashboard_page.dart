import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Dashboard",
          style: theme.textTheme.titleLarge,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: InkWell(
              onTap: () => controller.init(),
              child: const Row(
                children: [Text("Refresh Data"), Icon(Icons.refresh)],
              ),
            ),
          )
        ],
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
              Observer(builder: (context) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DashboardHeaderCard(
                      title: "Total Students",
                      data: NumberFormat("#,##0")
                          .format(controller.dashboardInfo.totalAlunos),
                    ),
                    const SizedBox(width: 20),
                    DashboardHeaderCard(
                      title: "Total Courses",
                      data: NumberFormat("#,##0")
                          .format(controller.dashboardInfo.totalCursos),
                    ),
                    const SizedBox(width: 20),
                    DashboardHeaderCard(
                      title: "Total Enrolments",
                      data: NumberFormat("#,##0")
                          .format(controller.dashboardInfo.totalMatriculas),
                    ),
                  ],
                );
              }),
              const SizedBox(height: 50),
              Container(
                width: width * (isSmall ? 1 : 0.8),
                height: width < 1000 ? height * 0.6 : height * 0.5,
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
                              Observer(builder: (context) {
                                final info = controller.dashboardInfo;
                                if (controller.loading) {
                                  return const CircularProgressIndicator();
                                }
                                return Chart(
                                  data: [
                                    (
                                      "Alunos Matriculados",
                                      info.alunosComMatricula.length,
                                      Colors.accents[Random()
                                          .nextInt(Colors.accents.length)]
                                    ),
                                    (
                                      "Alunos Matriculados",
                                      info.alunosSemMatricula.length,
                                      Colors.accents[Random()
                                          .nextInt(Colors.accents.length)]
                                    ),
                                  ],
                                  orientation: Axis.vertical,
                                );
                              }),
                              const SizedBox(height: 16),
                              Observer(builder: (context) {
                                final info = controller.dashboardInfo;
                                if (controller.loading) {
                                  return const CircularProgressIndicator();
                                }
                                return Chart(
                                  data: [
                                    ...info.matriculasPorCurso.map((e) => (
                                          e.curso,
                                          e.totalMatriculas,
                                          Colors.primaries[Random()
                                              .nextInt(Colors.accents.length)]
                                        ))
                                  ],
                                  orientation: Axis.vertical,
                                );
                              }),
                            ],
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Observer(builder: (context) {
                              final info = controller.dashboardInfo;
                              if (controller.loading) {
                                  return const CircularProgressIndicator();
                                }
                              return Chart(
                                data: [
                                  (
                                    "Alunos Matriculados",
                                    info.alunosComMatricula.length,
                                    Colors.accents[
                                        Random().nextInt(Colors.accents.length)]
                                  ),
                                  (
                                    "Alunos Sem Matricula",
                                    info.alunosSemMatricula.length,
                                    Colors.accents[
                                        Random().nextInt(Colors.accents.length)]
                                  ),
                                ],
                                orientation: Axis.horizontal,
                              );
                            }),
                            Observer(builder: (context) {
                              final info = controller.dashboardInfo;
                              if (controller.loading) {
                                  return const CircularProgressIndicator();
                                }
                              return Chart(
                                data: [
                                  ...info.matriculasPorCurso.map((e) => (
                                        e.curso,
                                        e.totalMatriculas,
                                        Colors.primaries[Random()
                                            .nextInt(Colors.accents.length)]
                                      ))
                                ],
                                orientation: Axis.horizontal,
                              );
                            }),
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
