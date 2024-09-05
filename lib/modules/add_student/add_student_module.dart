import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_vr_flutter/modules/add_student/add_student_controller.dart';
import 'package:teste_vr_flutter/modules/add_student/add_student_page.dart';

class AddStudentModule extends Module {

   @override
  void binds(Injector i) {
    i.add(AddStudentController.new);
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child("/", child:  (_) => const AddStudentPage());
    super.routes(r);
  }

}