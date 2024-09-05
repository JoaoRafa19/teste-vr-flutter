import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:teste_vr_flutter/modules/dashboard/dashboard_controller.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});

  final controller = Modular.get<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          children: [
            Observer(builder: (_) => Center(child: Text(controller.teste))),
            ElevatedButton(
                onPressed: () {
                  controller.setTeste("mudou");
                },
                child: Text(controller.teste))
          ],
        ),
      ),
    );
  }
}
