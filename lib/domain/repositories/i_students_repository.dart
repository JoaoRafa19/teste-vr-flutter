import 'package:teste_vr_flutter/domain/models/students_entity.dart';

abstract interface class IStudentsRepository {
  Future<(List<Student>?, Exception?)> getAllStudents();
  Future<(Student?, Exception?)> getStudentByID(int code);
  Future<(Student?, Exception?)> updateStudent(int code, Student student);
  Future<(Student?, Exception?)> createStudent(String name);
  Future<(List<Student>?, Exception?)> searchStudent(String query);
}