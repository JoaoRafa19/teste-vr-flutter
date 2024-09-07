import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_vr_flutter/domain/entities/students_entity.dart';
import 'package:teste_vr_flutter/modules/students/add_student/add_student_controller.dart';
import 'package:teste_vr_flutter/modules/students/add_student/add_student_page.dart';

class AddStudentModule extends Module {
  @override
  void binds(Injector i) {
    i.addInstance(AddStudentController((Modular.args.data as Student?), Modular.get(), Modular.get()));
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child("/", child: (_) => AddStudentPage());
    super.routes(r);
  }
}
