import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_vr_flutter/modules/add_student/add_student_module.dart';
import 'package:teste_vr_flutter/modules/students/students_page.dart';

class StudentsModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const StudentsPage());
    r.module('/create', module: AddStudentModule());
    super.routes(r);
  }
}
