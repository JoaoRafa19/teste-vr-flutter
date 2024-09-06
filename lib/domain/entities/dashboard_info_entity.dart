import 'package:teste_vr_flutter/domain/entities/entity.dart';
import 'package:teste_vr_flutter/domain/entities/students_entity.dart';

class DashboardInfo extends Entity {
  final int totalAlunos;
  final int totalCursos;
  final int totalMatriculas;
  final List<MatriculaPorCurso> matriculasPorCurso;
  final List<Student> alunosComMatricula;
  final List<Student> alunosSemMatricula;

  DashboardInfo({
    required this.totalAlunos,
    required this.totalCursos,
    required this.totalMatriculas,
    required this.matriculasPorCurso,
    required this.alunosComMatricula,
    required this.alunosSemMatricula,
  }) : super();

  DashboardInfo.invalid()
      : totalAlunos = 0,
        totalCursos = 0,
        totalMatriculas = 0,
        matriculasPorCurso = [],
        alunosComMatricula = [],
        alunosSemMatricula = [],
        super.invalid();
}

class MatriculaPorCurso extends Entity {
   String curso;
   int totalMatriculas;

  MatriculaPorCurso({
    required this.curso,
    required this.totalMatriculas,
  }) : super();

  MatriculaPorCurso.invalid()
      : curso = '',
        totalMatriculas = 0,
        super.invalid();


  
}
