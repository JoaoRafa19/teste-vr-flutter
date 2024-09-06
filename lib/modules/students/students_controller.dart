import 'package:mobx/mobx.dart';
import 'package:teste_vr_flutter/domain/entities/students_entity.dart';
import 'package:teste_vr_flutter/domain/repositories/i_students_repository.dart';
part 'students_controller.g.dart';

class StudentsController = StudentsControllerBase with _$StudentsController;

abstract class StudentsControllerBase with Store {
  IStudentsRepository repository;

  StudentsControllerBase(this.repository) {
    init();
  }

  @observable
  List<Student> filteredStudents = [];

  Future init() async {
    final (list, error) = await repository.getAllStudents();
    filteredStudents = [...list];
  }
  
}
