import 'package:teste_vr_flutter/domain/entities/course_entity.dart';
import 'package:teste_vr_flutter/domain/entities/enrolment_entity.dart';
import 'package:teste_vr_flutter/domain/entities/matricula_entity.dart';
import 'package:teste_vr_flutter/domain/entities/students_entity.dart';

abstract interface class IStudentsRepository {
  Future<(List<Student>, Exception?)> getAllStudents();
  Future<(Student, Exception?)> getStudentByID(int code);
  Future<(Student, Exception?)> updateStudent(int code, Student student);
  Future<(Student, Exception?)> createStudent(String name);
  Future<(List<Student>, Exception?)> searchStudent(String query);
  Future<(Enrolment, Exception?)> enrollStudent(
      Student student, List<Course> couses);
      Future<(List<Matricula>, Exception?)> getEnrolments(Student student);
      Future<(bool, Exception?)> deleteEnrolment(Student student, int course);
      Future<(bool, Exception?)> deleteStudent(Student student);
}
