// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_student_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddStudentController on _AddStudentControllerBase, Store {
  late final _$studentAtom =
      Atom(name: '_AddStudentControllerBase.student', context: context);

  @override
  Student? get student {
    _$studentAtom.reportRead();
    return super.student;
  }

  @override
  set student(Student? value) {
    _$studentAtom.reportWrite(value, super.student, () {
      super.student = value;
    });
  }

  late final _$enrolmentsAtom =
      Atom(name: '_AddStudentControllerBase.enrolments', context: context);

  @override
  List<Matricula> get enrolments {
    _$enrolmentsAtom.reportRead();
    return super.enrolments;
  }

  @override
  set enrolments(List<Matricula> value) {
    _$enrolmentsAtom.reportWrite(value, super.enrolments, () {
      super.enrolments = value;
    });
  }

  late final _$availableCoursesAtom = Atom(
      name: '_AddStudentControllerBase.availableCourses', context: context);

  @override
  List<Course> get availableCourses {
    _$availableCoursesAtom.reportRead();
    return super.availableCourses;
  }

  @override
  set availableCourses(List<Course> value) {
    _$availableCoursesAtom.reportWrite(value, super.availableCourses, () {
      super.availableCourses = value;
    });
  }

  late final _$errorAtom =
      Atom(name: '_AddStudentControllerBase.error', context: context);

  @override
  String? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('_AddStudentControllerBase.init', context: context);

  @override
  Future<dynamic> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$removeEnrolmentAsyncAction = AsyncAction(
      '_AddStudentControllerBase.removeEnrolment',
      context: context);

  @override
  Future<void> removeEnrolment(Matricula enrolment) {
    return _$removeEnrolmentAsyncAction
        .run(() => super.removeEnrolment(enrolment));
  }

  @override
  String toString() {
    return '''
student: ${student},
enrolments: ${enrolments},
availableCourses: ${availableCourses},
error: ${error}
    ''';
  }
}
