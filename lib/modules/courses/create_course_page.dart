import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_vr_flutter/modules/courses/courses_controller.dart';
import 'package:teste_vr_flutter/modules/courses/courses_module.dart';

class CreateCoursePage extends StatefulWidget {
  const CreateCoursePage({super.key});

  @override
  CreateCoursePageState createState() => CreateCoursePageState();
}

class CreateCoursePageState extends State<CreateCoursePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _syllabusController = TextEditingController();

  final controller = Modular.get<CoursesController>();

  @override
  void initState() {
    if (controller.activeEditinCourse != null) {
      _descriptionController.text = controller.activeEditinCourse!.description;
      _syllabusController.text = controller.activeEditinCourse!.theme;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton.outlined(
            onPressed: () {
              Modular.to.navigate(CoursesModule.path);
            },
            icon: const Icon(Icons.arrow_back)),
        title: Text(controller.activeEditinCourse != null
            ? "Edit course"
            : 'Create Course'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _syllabusController,
                decoration: InputDecoration(
                  labelText: 'Syllabus',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a syllabus';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final String description = _descriptionController.text;
                      final String syllabus = _syllabusController.text;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'Course $description ${controller.activeEditinCourse != null ? 'edited' : 'created'} successfully!'),
                        ),
                      );
                      if (controller.activeEditinCourse != null) {
                        await controller.editCurso(syllabus, description);
                      } else {
                        await controller.addCurso(syllabus, description);
                      }
                      _descriptionController.clear();
                      _syllabusController.clear();
                      Modular.to.navigate(CoursesModule.path);
                    }
                  },
                  child: Text(controller.activeEditinCourse != null
                      ? 'Editing course'
                      : 'Create Course'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
