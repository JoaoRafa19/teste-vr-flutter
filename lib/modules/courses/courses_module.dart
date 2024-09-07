import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_vr_flutter/modules/courses/courses_controller.dart';
import 'package:teste_vr_flutter/modules/courses/courses_page.dart';
import 'package:teste_vr_flutter/modules/courses/create_course_page.dart';

class CoursesModule extends Module {
  static const path = "/home/courses/";

  @override
  void binds(Injector i) {
    i.addInstance(CoursesController(Modular.get()));
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child("/", child: (_) =>  CoursesPage());
    r.child("/create", child: (_) => const CreateCoursePage());
    super.routes(r);
  }
}
