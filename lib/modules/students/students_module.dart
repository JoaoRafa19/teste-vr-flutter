import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_vr_flutter/modules/students/students_page.dart';

class StudentsModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const StudentsPage());
    super.routes(r);
  }
}