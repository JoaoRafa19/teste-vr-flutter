
import 'package:teste_vr_flutter/domain/entities/entity.dart';

class Enrolment  extends Entity {
  final int code;
  final int studentCode;
  final int courseCode;

  Enrolment.invalid()
      : code = -1,
        studentCode = -1,
        courseCode = -1;

  Enrolment(
      {required this.code, required this.studentCode, required this.courseCode})
      : super();
}
