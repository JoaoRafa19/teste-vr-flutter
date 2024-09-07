import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_vr_flutter/core/rest_client/dio_rest_client.dart';
import 'package:teste_vr_flutter/domain/repositories/i_courses_repository.dart';
import 'package:teste_vr_flutter/impl/repositories/course_repository_impl.dart';
import 'package:teste_vr_flutter/modules/courses/courses_controller.dart';
import 'package:teste_vr_flutter/modules/courses/courses_page.dart';
import 'package:teste_vr_flutter/modules/courses/create_course_page.dart';

class CoursesModule extends Module {
  static const path = "/home/courses/";

  @override
  void binds(Injector i) {
    i.addInstance(CoursesController(
        CoursesRepositoryImpl(Modular.get<RestClient>())
            as ICoursesRepository));
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child("/", child: (_) => CoursesPage());
    r.child("/create", child: (_) => const CreateCoursePage());
    super.routes(r);
  }
}
