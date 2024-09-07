import 'package:mobx/mobx.dart';
import 'package:teste_vr_flutter/domain/entities/course_entity.dart';
import 'package:teste_vr_flutter/domain/repositories/i_courses_repository.dart';

part 'courses_controller.g.dart';

class CoursesController = CoursesControllerBase with _$CoursesController;

abstract class CoursesControllerBase with Store {
  final ICoursesRepository coursesRepository;

  CoursesControllerBase(this.coursesRepository);

  @observable
  List<Course> courses = [];

  @observable
  List<Course> filteredCourses = [];

  @observable
  Course? activeEditinCourse;

  @observable
  String? errorMessage;

  @action
  Future<void> getAllCourses() async {
    final (fetchedCourses, err) = await coursesRepository.getAll();
    if (err == null) {
      courses = fetchedCourses;
      filteredCourses = fetchedCourses;
    } else {
      errorMessage = err.toString();
    }
  }

  @action
  addCurso(String theme, String description) async {
    final (curso, err) =
        await coursesRepository.createCourse(theme, description);
    if (err != null) {
      return;
    } else {
      courses = [...courses, curso];
    }
  }

  @action
  editCurso(String theme, String description) async {
    if (activeEditinCourse != null) {
      final (novoCurso, err) = await coursesRepository.updateCourse(
          activeEditinCourse!.code,
          activeEditinCourse!
            ..description = description
            ..theme = theme);
      if (err != null) {
        return;
      }
      await getAllCourses();
    }
  }

  @action
  filterCourses(String query) {
    query = query.toLowerCase();
    filteredCourses = courses
        .where((course) =>
            course.description.toLowerCase().contains(query) ||
            course.theme.toLowerCase().contains(query))
        .toList();
  }
}
