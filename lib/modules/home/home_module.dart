import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_vr_flutter/modules/dashboard/dashboard_controller.dart';
import 'package:teste_vr_flutter/modules/dashboard/dashboard_page.dart';
import 'package:teste_vr_flutter/modules/home/home_controller.dart';
import 'package:teste_vr_flutter/modules/home/home_page.dart';
import 'package:teste_vr_flutter/modules/students/students_page.dart';

class HomeModule extends Module {
  @override
  void binds(Injector i) {
    i.add(HomeController.new);
    i.add(DashboardController.new);
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) =>  HomePage(),
      children: [
        ChildRoute('/dashboard', child: (_) => DashboardPage()),
        ChildRoute('/students',
            child: (context) =>
                const StudentsPage()),
      ],
    );
    super.routes(r);
  }
}

class InternalPage extends StatelessWidget {
  final String title;
  final Color color;
  const InternalPage({super.key, required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      child: Center(child: Text(title)),
    );
  }
}
