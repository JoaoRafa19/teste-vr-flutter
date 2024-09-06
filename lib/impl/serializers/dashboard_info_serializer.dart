import './student_serializer.dart';
import 'package:teste_vr_flutter/domain/entities/dashboard_info_entity.dart';

abstract class DashboardInfoSerializer {
  static DashboardInfo fromJson(Map<String, dynamic> json) {
    return DashboardInfo(
      totalAlunos: json['total_alunos'],
      totalCursos: json['total_cursos'],
      totalMatriculas: json['total_matriculas'],
      matriculasPorCurso: (json['matriculas_por_curso'] as List)
          .map((item) => SerializeMatricula.fromJson(item))
          .toList(),
      alunosComMatricula: (json['alunos_com_matricula'] as List)
          .map((s) => SerializeStudent.fromJson(s))
          .toList(),
      alunosSemMatricula: (json['alunos_sem_matricula'] as List)
          .map((s) => SerializeStudent.fromJson(s))
          .toList(),
    );
  }

  static Map<String, dynamic> toJson(DashboardInfo i) => {
        'total_alunos': i.totalAlunos,
        'total_cursos': i.totalCursos,
        'total_matriculas': i.totalMatriculas,
        'matriculas_por_curso':
            i.matriculasPorCurso.map(SerializeMatricula.toJson).toList(),
        'alunos_com_matricula':
            i.alunosComMatricula.map(SerializeStudent.toJson).toList(),
        'alunos_sem_matricula':
            i.alunosSemMatricula.map(SerializeStudent.toJson).toList(),
      };
}

abstract class SerializeMatricula {
  static MatriculaPorCurso fromJson(Map<String, dynamic> json) {
    return MatriculaPorCurso(
      curso: json['curso'],
      totalMatriculas: json['total_matriculas'],
    );
  }

  static Map<String, dynamic> toJson(MatriculaPorCurso entity) => {
        'curso': entity.curso,
        'total_matriculas': entity.totalMatriculas,
      };
}
