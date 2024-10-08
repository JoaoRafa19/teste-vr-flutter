import 'package:teste_vr_flutter/domain/entities/entity.dart';

class Course extends Entity {
  final int code;
  String description;
  String theme;

  Course.invalid()
      : code = -1,
        description = '',
        theme = '';

  Course({required this.code, required this.description, required this.theme})
      : super();
}
