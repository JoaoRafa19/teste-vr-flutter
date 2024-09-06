import 'package:teste_vr_flutter/domain/entities/entity.dart';

class Student extends Entity {
  int code;
  String nome;

  Student.invalid()
      : code = -1,
        nome = '';

  Student({required this.nome, required this.code}) : super();
}
