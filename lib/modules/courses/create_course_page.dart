import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
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

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton.outlined(
            onPressed: () {
              Modular.to.navigate(CoursesModule.path);
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text('Create Course'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Campo de Descrição
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

              // Campo de Ementa
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

              // Botão para salvar o curso
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final String description = _descriptionController.text;
                      //final String syllabus = _syllabusController.text;
                      // Lógica para salvar o curso
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content:
                              Text('Course $description created successfully!'),
                        ),
                      );

                      // Limpar campos após salvar
                      _descriptionController.clear();
                      _syllabusController.clear();
                    }
                  },
                  child: const Text('Create Course'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
