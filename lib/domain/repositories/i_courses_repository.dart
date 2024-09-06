import 'package:teste_vr_flutter/domain/entities/course_entity.dart';

abstract interface class ICoursesRepository {
  Future<(Course, Exception?)> createCourse(String theme, String description);
  Future<(Course, Exception?)> getCourse(int id);
  Future<(Course, Exception?)> updateCourse(int id, Course course);
  Future<(List<Course>, Exception?)> getAll();
}
