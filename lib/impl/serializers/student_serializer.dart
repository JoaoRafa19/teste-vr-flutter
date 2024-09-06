import 'package:teste_vr_flutter/domain/entities/students_entity.dart';

extension SerializableStudent on Student {
  Student fromJson(Map<String, dynamic> json) {
    return Student(
      code: json["codigo"],
      nome: json["nome"],
    );
  }

  Map<String, dynamic> get toJson => {
        "codigo": code,
        "nome": nome,
      };
}
