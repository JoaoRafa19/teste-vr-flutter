import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:teste_vr_flutter/modules/courses/courses_controller.dart';

class CoursesPage extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();
  final controller = Modular.get<CoursesController>();

  CoursesPage({super.key}) {
    controller.getAllCourses();
    _searchController.addListener(() {
      controller.filterCourses(_searchController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Courses'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Campo de busca
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: "Search courses",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "All Courses",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),

            // Lista de cursos
            Expanded(
              child: Observer(
                builder: (_) {
                  final filteredCourses = controller.filteredCourses;

                  if (filteredCourses.isEmpty) {
                    return const Center(
                      child: Text(
                        'No courses found',
                        style: TextStyle(fontSize: 16),
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: filteredCourses.length,
                    itemBuilder: (context, index) {
                      final course = filteredCourses[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: ListTile(
                          title: Text(course.description),
                          subtitle: Text(course.theme),
                          trailing: IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              controller.activeEditinCourse = course;
                              Modular.to.navigate("/home/courses/create",
                                  arguments: course);
                            },
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton.icon(
                onPressed: () {
                  controller.activeEditinCourse = null;
                  Modular.to.navigate("/home/courses/create");
                },
                icon: const Icon(Icons.add),
                label: const Text("Add Course"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
