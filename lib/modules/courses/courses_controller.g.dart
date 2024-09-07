// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'courses_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CoursesController on CoursesControllerBase, Store {
  late final _$coursesAtom =
      Atom(name: 'CoursesControllerBase.courses', context: context);

  @override
  List<Course> get courses {
    _$coursesAtom.reportRead();
    return super.courses;
  }

  @override
  set courses(List<Course> value) {
    _$coursesAtom.reportWrite(value, super.courses, () {
      super.courses = value;
    });
  }

  late final _$filteredCoursesAtom =
      Atom(name: 'CoursesControllerBase.filteredCourses', context: context);

  @override
  List<Course> get filteredCourses {
    _$filteredCoursesAtom.reportRead();
    return super.filteredCourses;
  }

  @override
  set filteredCourses(List<Course> value) {
    _$filteredCoursesAtom.reportWrite(value, super.filteredCourses, () {
      super.filteredCourses = value;
    });
  }

  late final _$activeEditinCourseAtom =
      Atom(name: 'CoursesControllerBase.activeEditinCourse', context: context);

  @override
  Course? get activeEditinCourse {
    _$activeEditinCourseAtom.reportRead();
    return super.activeEditinCourse;
  }

  @override
  set activeEditinCourse(Course? value) {
    _$activeEditinCourseAtom.reportWrite(value, super.activeEditinCourse, () {
      super.activeEditinCourse = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: 'CoursesControllerBase.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$getAllCoursesAsyncAction =
      AsyncAction('CoursesControllerBase.getAllCourses', context: context);

  @override
  Future<void> getAllCourses() {
    return _$getAllCoursesAsyncAction.run(() => super.getAllCourses());
  }

  late final _$addCursoAsyncAction =
      AsyncAction('CoursesControllerBase.addCurso', context: context);

  @override
  Future addCurso(String theme, String description) {
    return _$addCursoAsyncAction.run(() => super.addCurso(theme, description));
  }

  late final _$editCursoAsyncAction =
      AsyncAction('CoursesControllerBase.editCurso', context: context);

  @override
  Future editCurso(String theme, String description) {
    return _$editCursoAsyncAction
        .run(() => super.editCurso(theme, description));
  }

  late final _$CoursesControllerBaseActionController =
      ActionController(name: 'CoursesControllerBase', context: context);

  @override
  dynamic filterCourses(String query) {
    final _$actionInfo = _$CoursesControllerBaseActionController.startAction(
        name: 'CoursesControllerBase.filterCourses');
    try {
      return super.filterCourses(query);
    } finally {
      _$CoursesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
courses: ${courses},
filteredCourses: ${filteredCourses},
activeEditinCourse: ${activeEditinCourse},
errorMessage: ${errorMessage}
    ''';
  }
}
