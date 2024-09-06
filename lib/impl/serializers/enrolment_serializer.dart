import 'package:teste_vr_flutter/domain/entities/enrolment_entity.dart';

extension SerializableEnrolment on Enrolment {
  Enrolment fromJson(Map<String, dynamic> json) {
    return Enrolment(
      code: json['codigo'] ?? -1,
      studentCode: json['codigo_aluno'] ?? -1,
      courseCode: json['codigo_curso'] ?? -1,
    );
  }

  // Converter de Enrolment para JSON
  Map<String, dynamic> get toJson => {
        'codigo': code,
        'codigo_aluno': studentCode,
        'codigo_curso': courseCode,
      };
}
