import 'package:mobx/mobx.dart';
import 'package:teste_vr_flutter/domain/entities/students_entity.dart';
part 'add_student_controller.g.dart';

class AddStudentController = _AddStudentControllerBase
    with _$AddStudentController;

abstract class _AddStudentControllerBase with Store {

  _AddStudentControllerBase(this.student);
  final Student? student;
}
