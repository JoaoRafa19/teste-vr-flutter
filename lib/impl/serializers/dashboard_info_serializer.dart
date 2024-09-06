import './student_serializer.dart';
import 'package:teste_vr_flutter/domain/entities/dashboard_info_entity.dart';
import 'package:teste_vr_flutter/domain/entities/students_entity.dart';

extension SerializableDashboardInfo on DashboardInfo {
  static DashboardInfo fromJson(Map<String, dynamic> json) {
    return DashboardInfo(
      totalAlunos: json['total_alunos'],
      totalCursos: json['total_cursos'],
      totalMatriculas: json['total_matriculas'],
      matriculasPorCurso: (json['matriculas_por_curso'] as List)
          .map((item) => MatriculaPorCurso.invalid().fromJson(item)..validate)
          .toList(),
      alunosComMatricula: (json['alunos_com_matricula'] as List)
          .map((item) => Student.invalid().fromJson(item)..validate)
          .toList(),
      alunosSemMatricula: (json['alunos_sem_matricula'] as List)
          .map((item) => Student.invalid().fromJson(item)..validate)
          .toList(),
    );
  }

  Map<String, dynamic> get toJson => {
        'total_alunos': totalAlunos,
        'total_cursos': totalCursos,
        'total_matriculas': totalMatriculas,
        'matriculas_por_curso':
            matriculasPorCurso.map((e) => e.toJson).toList(),
        'alunos_com_matricula':
            alunosComMatricula.map((e) => e.toJson).toList(),
        'alunos_sem_matricula':
            alunosSemMatricula.map((e) => e.toJson).toList(),
      };
}

extension SerializableMatriculaPorCurso on MatriculaPorCurso {
  MatriculaPorCurso fromJson(Map<String, dynamic> json) {
    return MatriculaPorCurso(
      curso: json['curso'],
      totalMatriculas: json['total_matriculas'],
    );
  }

  Map<String, dynamic> get toJson => {
        'curso': curso,
        'total_matriculas': totalMatriculas,
      };
}
