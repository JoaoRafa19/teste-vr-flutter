import 'package:teste_vr_flutter/domain/entities/entity.dart';

class Enrolment extends Entity {
  int code;
  int studentCode;
  int courseCode;

  Enrolment.invalid()
      : code = -1,
        studentCode = -1,
        courseCode = -1;

  Enrolment(
      {required this.code, required this.studentCode, required this.courseCode})
      : super();
}
