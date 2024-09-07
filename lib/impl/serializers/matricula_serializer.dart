
import 'package:teste_vr_flutter/domain/entities/matricula_entity.dart';

abstract class SerializeMatricula {
  static Matricula fromJson(Map<String, dynamic> json) {
    return Matricula(
      code: json["codigo"],
      description: json["descricao"],
      theme: json["ementa"],
    );
  }

  static Map<String, dynamic> toJson(Matricula enrolment) => {
        "codigo": enrolment.code,
        "descricao": enrolment.description,
        "ementa": enrolment.theme,
      };
}
