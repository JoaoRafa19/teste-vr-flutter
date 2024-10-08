import 'dart:convert';

import 'package:teste_vr_flutter/core/rest_client/dio_rest_client.dart';
import 'package:teste_vr_flutter/domain/entities/course_entity.dart';
import 'package:teste_vr_flutter/domain/entities/enrolment_entity.dart';
import 'package:teste_vr_flutter/domain/entities/matricula_entity.dart';
import 'package:teste_vr_flutter/domain/entities/students_entity.dart';
import 'package:teste_vr_flutter/domain/repositories/i_students_repository.dart';
import 'package:teste_vr_flutter/impl/serializers/enrolment_serializer.dart';
import 'package:teste_vr_flutter/impl/serializers/matricula_serializer.dart';
import 'package:teste_vr_flutter/impl/serializers/student_serializer.dart';

class StudentsRepositoryImpl implements IStudentsRepository {
  final RestClient client;

  StudentsRepositoryImpl(this.client);

  @override
  Future<(Student, Exception?)> createStudent(String name) async {
    try {
      final response = await client.post("/aluno", data: {"nome": name});
      if (response.data != null && response.statusCode == 200) {
        final code = response.data["codigo"];
        return (Student(nome: name, code: code), null);
      }
      return (Student.invalid(), Exception("não foi possivel criar aluno"));
    } catch (e) {
      return (Student.invalid(), Exception("erro ao criar aluno"));
    }
  }

  @override
  Future<(Enrolment, Exception?)> enrollStudent(
      Student student, List<Course> courses) async {
    try {
      final response = await client.post("/aluno/${student.code}/matricula",
          data: {"cursos": courses.map((e) => e.code).toList()});
      if (response.data != null && response.statusCode == 200) {
        final enrolment = EnrolmentSerializer.fromJson(response.data);
        return (enrolment, null);
      }
      return (
        Enrolment.invalid(),
        Exception("não foi possivel fazer matrícula")
      );
    } catch (e) {
      return (Enrolment.invalid(), Exception("erro ao fazer matricula"));
    }
  }

  @override
  Future<(List<Student>, Exception?)> getAllStudents() async {
    try {
      final response = await client.get(
        "/aluno",
      );
      if (response.data != null && response.statusCode == 200) {
        final students = (jsonDecode(response.data) as List)
            .map((e) => SerializeStudent.fromJson(e))
            .toList();
        return (students, null);
      }
      return (<Student>[], Exception("não foi possivel fazer matrícula"));
    } catch (e) {
      return (<Student>[], Exception("erro ao buscar usuários"));
    }
  }

  @override
  Future<(Student, Exception?)> getStudentByID(int code) async {
    try {
      final response = await client.get("/aluno/$code");
      if (response.data != null && response.statusCode == 200) {
        final student = SerializeStudent.fromJson(response.data);
        return (student, null);
      }
      return (Student.invalid(), Exception("não foi possivel encontrar aluno"));
    } catch (e) {
      return (Student.invalid(), Exception("erro ao encontrar aluno"));
    }
  }

  @override
  Future<(List<Student>, Exception?)> searchStudent(String query) async {
    try {
      final response =
          await client.get("/aluno/search", queryParameters: {"q": query});
      if (response.data != null && response.statusCode == 200) {
        final students = (response.data as List)
            .map((e) => SerializeStudent.fromJson(e))
            .toList();
        return (students, null);
      }
      return (<Student>[], Exception("aluno não encontrado"));
    } catch (e) {
      return (<Student>[], Exception("erro ao buscar aluno"));
    }
  }

  @override
  Future<(Student, Exception?)> updateStudent(int code, Student student) async {
    try {
      final response =
          await client.patch("/aluno/$code", data: {"nome": student.nome});
      if (response.data != null && response.statusCode == 200) {
        final student = SerializeStudent.fromJson(response.data);
        return (student, null);
      }
      return (Student.invalid(), Exception("não foi possivel editar aluno"));
    } catch (e) {
      return (Student.invalid(), Exception("erro ao editar aluno"));
    }
  }

  @override
  Future<(List<Matricula>, Exception?)> getEnrolments(Student student) async {
    try {
      final response = await client.get(
        "/aluno/${student.code}/matricula",
      );
      if (response.data != null && response.statusCode == 200) {
        final enrolments = (jsonDecode(response.data) as List)
            .map((e) => SerializeMatricula.fromJson(e))
            .toList();
        return (enrolments, null);
      }
      return (<Matricula>[], Exception("aluno não encontrado"));
    } catch (e) {
      return (<Matricula>[], Exception("erro ao buscar aluno"));
    }
  }

  @override
  Future<(bool, Exception?)> deleteEnrolment(
      Student student, int course) async {
    try {
      final response = await client.delete(
        "/aluno/${student.code}/$course",
      );
      if (response.statusCode == 204) {
        return (true, null);
      }
      return (false, Exception("não foi possível remover a matrícula"));
    } catch (e) {
      return (false, Exception("erro ao remover matrícula"));
    }
  }

  @override
  Future<(bool, Exception?)> deleteStudent(Student student) async {
    try {
      final response = await client.delete("/aluno/${student.code}");
      if (response.statusCode == 204) {
        return (true, null);
      }
      return (false, Exception("não foi possível remover o aluno"));
    } catch (e) {
      return (false, Exception("erro ao remover aluno"));
    }
  }
}
