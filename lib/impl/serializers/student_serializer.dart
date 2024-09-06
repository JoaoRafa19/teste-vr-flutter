import 'package:teste_vr_flutter/domain/entities/students_entity.dart';

abstract class SerializeStudent {
  static Student fromJson(Map<String, dynamic> json) {
    return Student(
      code: json["codigo"],
      nome: json["nome"],
    );
  }

  static Map<String, dynamic> toJson(Student entity) => {
        "codigo": entity.code,
        "nome": entity.nome,
      };
}
