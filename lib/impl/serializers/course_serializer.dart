

import 'package:teste_vr_flutter/domain/entities/course_entity.dart';

extension Serializable on Course {
   static Course fromJson(Map<String, dynamic> json){
    return Course(code: json["codigo"], description: json["descricao"], theme: json["ementa"]);

  }
  Map<String, dynamic> get toJson => {
    "codigo": code,
    "descricao": description,
    "ementa": theme
  };
}
