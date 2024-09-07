import 'package:teste_vr_flutter/domain/entities/entity.dart';

class Matricula extends Entity {
  final int code;
  final String description;
  final String theme;

  Matricula({
    required this.code,
    required this.description,
    required this.theme,
  }) : super();

  Matricula.invalid()
      : code = -1,
        description = '',
        theme = '',
        super.invalid();
}
