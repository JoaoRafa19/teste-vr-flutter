import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_vr_flutter/modules/dashboard/dashboard_controller.dart';
import 'package:teste_vr_flutter/modules/dashboard/dashboard_page.dart';

class DashboardModule extends Module {
  @override
  void binds(Injector i) {
    i.addInstance(DashboardController());
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => DashboardPage());
    super.routes(r);
  }
}
