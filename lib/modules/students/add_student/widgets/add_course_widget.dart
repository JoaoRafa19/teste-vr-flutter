import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:teste_vr_flutter/modules/students/add_student/add_student_controller.dart';

class AddEnrolmentModal extends StatelessWidget {
  final AddStudentController controller;

  const AddEnrolmentModal({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    return Observer(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Add Enrolment'),
            leading: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Available Courses',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: "Search courses...",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onChanged: (value) {
                    controller.filterCourses(value); // Método para filtrar
                  },
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: Observer(
                    builder: (_) {
                      if (controller.filteredCourses.isEmpty) {
                        return const Center(
                          child: Text(
                            'No courses found',
                            style: TextStyle(fontSize: 16),
                          ),
                        );
                      }
                      return ListView.builder(
                        itemCount: controller.filteredCourses.length,
                        itemBuilder: (context, index) {
                          final course = controller.filteredCourses[index];
                          return ListTile(
                            title: Text(course.description),
                            subtitle: Text(course.theme),
                            trailing: IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () async {
                                final nav = Navigator.of(context);
                                final of = ScaffoldMessenger.of(context);
                                final result =
                                    await controller.addEnrolment(course);
                                if (!result) {
                                  of.showSnackBar(
                                    SnackBar(
                                      content: Text(controller.error ?? "Error"),
                                    ),
                                  );
                                }
                                nav.pop();
                              },
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
