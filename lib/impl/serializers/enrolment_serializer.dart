import 'package:teste_vr_flutter/domain/entities/enrolment_entity.dart';

abstract class EnrolmentSerializer {
  static Enrolment fromJson(Map<String, dynamic> json) {
    return Enrolment(
      code: json['codigo'] ?? -1,
      studentCode: json['codigo_aluno'] ?? -1,
      courseCode: json['codigo_curso'] ?? -1,
    );
  }

  static Map<String, dynamic> toJson(Enrolment entity) => {
        'codigo': entity.code,
        'codigo_aluno': entity.studentCode,
        'codigo_curso': entity.courseCode,
      };
}
