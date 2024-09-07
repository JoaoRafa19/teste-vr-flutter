
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_vr_flutter/core/rest_client/dio_rest_client.dart';
import 'package:teste_vr_flutter/domain/repositories/i_courses_repository.dart';
import 'package:teste_vr_flutter/domain/repositories/i_students_repository.dart';
import 'package:teste_vr_flutter/impl/repositories/course_repository_impl.dart';
import 'package:teste_vr_flutter/impl/repositories/students_repository_impl.dart';
import 'package:teste_vr_flutter/modules/students/add_student/add_student_module.dart';
import 'package:teste_vr_flutter/modules/students/students_page.dart';


class StudentsModule extends Module {
  @override
  void binds(Injector i) {
    i.addInstance(StudentsRepositoryImpl(Modular.get<RestClient>()) as IStudentsRepository);
    i.addInstance(CoursesRepositoryImpl(Modular.get()) as ICoursesRepository);
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => StudentsPage());
    r.module('/create', module: AddStudentModule());
    super.routes(r);
  }
}
