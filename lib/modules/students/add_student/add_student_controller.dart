import 'package:mobx/mobx.dart';
import 'package:teste_vr_flutter/domain/entities/course_entity.dart';
import 'package:teste_vr_flutter/domain/entities/matricula_entity.dart';
import 'package:teste_vr_flutter/domain/entities/students_entity.dart';
import 'package:teste_vr_flutter/domain/repositories/i_courses_repository.dart';
import 'package:teste_vr_flutter/domain/repositories/i_students_repository.dart';
part 'add_student_controller.g.dart';

class AddStudentController = _AddStudentControllerBase
    with _$AddStudentController;

abstract class _AddStudentControllerBase with Store {
  IStudentsRepository studentsRepository;
  ICoursesRepository coursesRepository;

  _AddStudentControllerBase(
      this.student, this.studentsRepository, this.coursesRepository) {
    init();
  }

  @observable
  Student? student;

  @observable
  List<Matricula> enrolments = [];

  @observable
  List<Course> availableCourses = [];

  @observable
  String? error;

  @observable
  bool loading = false;

  @observable
  List<Course> filteredCourses = [];

  @action
  void filterCourses(String query) {
    final lowerCaseQuery = query.toLowerCase();
    filteredCourses = availableCourses.where((course) {
      final courseName = course.description.toLowerCase();
      return courseName.contains(lowerCaseQuery);
    }).toList();
  }

  @action
  Future init() async {
    if (student != null) {
      final (enrols, err) = await studentsRepository.getEnrolments(student!);
      if (err == null) {
        enrolments = [...enrols];
      }
      final (courses, errro) = await coursesRepository.getAll();
      if (errro == null) {
        availableCourses = [...courses];
        filteredCourses = [...courses];
      }
    }
  }

  @action
  Future deleteStudent() async {
    if (student != null) {
      final (_, _) = await studentsRepository.deleteStudent(student!);
      await init();
    }
  }

  Future<bool> addEnrolment(Course course) async {
    loading=true;
    if (student != null) {
      final (enrolment, err) = await studentsRepository.enrollStudent(
        student!,
        [course],
      );
      if (err == null && enrolment.isValid) {
        await init();
        loading=false;
        return true;
      } else {
        error = err.toString().split(":")[1];
        loading=false;
        return false;
      }
    }
    loading=false;
    return true;
  }

  @action
  Future<void> removeEnrolment(Matricula enrolment) async {
    loading=true;
    final (res, err) =
        await studentsRepository.deleteEnrolment(student!, enrolment.code);
    if (err == null && res) {
      enrolments.remove(enrolment);
      enrolments = [...enrolments];
    }
  }

  Future addStudent(String name) async {
    final (newStudent, err) = await studentsRepository.createStudent(name);
    if (err == null && newStudent.isValid) {
      student = newStudent;
    }
  }

  Future<bool> editStudent(String name) async {
    if (student != null) {
      final (std, err) = await studentsRepository.updateStudent(
          student!.code, student!..nome = name);
      if (err == null && std.isValid) {
        student = std;
        return true;
      } else {
        return false;
      }
    }
    return true;
  }
}
