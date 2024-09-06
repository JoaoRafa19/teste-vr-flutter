import 'package:teste_vr_flutter/domain/entities/course_entity.dart';

abstract class SerializeCourse {
  static Course fromJson(Map<String, dynamic> json) {
    return Course(
        code: json["codigo"],
        description: json["descricao"],
        theme: json["ementa"]);
  }

  Map<String, dynamic> toJson(Course course) => {
        "codigo": course.code,
        "descricao": course.description,
        "ementa": course.theme,
      };
}
