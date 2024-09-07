import 'package:teste_vr_flutter/core/rest_client/dio_rest_client.dart';
import 'package:teste_vr_flutter/domain/entities/course_entity.dart';
import 'package:teste_vr_flutter/domain/repositories/i_courses_repository.dart';

class CoursesRepositoryImpl implements ICoursesRepository {
  final RestClient client;

  CoursesRepositoryImpl(this.client);

  @override
  Future<(Course, Exception?)> createCourse(String theme, String description) async {
    try {
      final response = await client.post("/curso", data: {
        "ementa": theme,
        "descricao": description,
      });

      if (response.statusCode == 200 && response.data != null) {
        final course = Course(
          code: response.data["codigo"],
          description: response.data["descricao"],
          theme: response.data["ementa"],
        );
        return (course, null);
      }

      return (Course.invalid(), Exception("Failed to create course"));
    } catch (e) {
      return (Course.invalid(), Exception("Error creating course: $e"));
    }
  }

  @override
  Future<(Course, Exception?)> getCourse(int id) async {
    try {
      final response = await client.get("/curso/$id");

      if (response.statusCode == 200 && response.data != null) {
        final course = Course(
          code: response.data["codigo"],
          description: response.data["descricao"],
          theme: response.data["ementa"],
        );
        return (course, null);
      }

      return (Course.invalid(), Exception("Course not found"));
    } catch (e) {
      return (Course.invalid(), Exception("Error fetching course: $e"));
    }
  }

  @override
  Future<(Course, Exception?)> updateCourse(int id, Course course) async {
    try {
      final response = await client.patch("/curso/$id", data: {
        "descricao": course.description,
        "ementa": course.theme,
      });

      if (response.statusCode == 200 && response.data != null) {
        final updatedCourse = Course(
          code: response.data["codigo"],
          description: response.data["descricao"],
          theme: response.data["ementa"],
        );
        return (updatedCourse, null);
      }

      return (Course.invalid(), Exception("Failed to update course"));
    } catch (e) {
      return (Course.invalid(), Exception("Error updating course: $e"));
    }
  }

  @override
  Future<(List<Course>, Exception?)> getAll() async {
    try {
      final response = await client.get("/curso");

      if (response.statusCode == 200 && response.data != null) {
        final courses = (response.data as List)
            .map((courseJson) => Course(
                  code: courseJson["codigo"],
                  description: courseJson["descricao"],
                  theme: courseJson["ementa"],
                ))
            .toList();
        return (courses, null);
      }

      return (<Course>[], Exception("No courses found"));
    } catch (e) {
      return (<Course>[], Exception("Error fetching courses: $e"));
    }
  }
}
