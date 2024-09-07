import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_vr_flutter/modules/students/add_student/add_student_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:teste_vr_flutter/modules/students/add_student/widgets/add_course_widget.dart';

class AddStudentPage extends StatelessWidget {
  AddStudentPage({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();

  final controller = Modular.get<AddStudentController>();

  @override
  Widget build(BuildContext context) {
    if (controller.student != null) {
      _nameController.text = controller.student!.nome;
    }
    return Scaffold(
      appBar: AppBar(
        leading: IconButton.outlined(
            onPressed: () {
              Modular.to.navigate('/home/students');
            },
            icon: const Icon(Icons.arrow_back)),
        title:
            Text(controller.student == null ? 'Add Student' : "Edit Student"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),

              Visibility(
                visible: controller.student != null,
                child: Observer(builder: (_) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (controller.enrolments.isNotEmpty) ...[
                        const Text(
                          'Enrolled Courses:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: controller.enrolments.map((enrolment) {
                            return Chip(
                              label: Text('Curso: ${enrolment.theme}'),
                              deleteIcon: const Icon(Icons.close),
                              onDeleted: () async {
                                await controller.removeEnrolment(enrolment);
                              },
                            );
                          }).toList(),
                        ),
                      ] else ...[
                        const Text('No enrolments yet'),
                      ]
                    ],
                  );
                }),
              ),

              const SizedBox(height: 32),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final String name = _nameController.text;
                      var of = ScaffoldMessenger.of(context);

                      if (controller.student == null) {
                        await controller.addStudent(name);
                        of.showSnackBar(
                          SnackBar(
                            content: Text(controller.student == null
                                ? 'Error adding Student!'
                                : 'Student $name added successfully!'),
                          ),
                        );
                        _nameController.clear();
                      } else {
                        final result = await controller.editStudent(name);
                        if (!result) {
                          of.showSnackBar(
                            const SnackBar(
                              content: Text('Error editing Student!'),
                            ),
                          );
                        }
                        Modular.to.navigate('/home/students');
                      }
                    }
                  },
                  child:
                      Text(controller.student != null ? 'Save' : 'Add Student'),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Visibility(
        visible: controller.student != null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (_) => AddEnrolmentModal(controller: controller,),
                );
              },
              child: const Text('Add Enrolment'),
            ),
            const SizedBox(
               width: 50,
            ),
            ElevatedButton(
              onPressed: () async {
                final confirmed = await showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Delete Student"),
                      content: const Text(
                          "Are you sure you want to delete this student?"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context, false);
                          },
                          child: const Text("Cancel"),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context, true);
                          },
                          child: const Text("Delete"),
                        ),
                      ],
                    );
                  },
                );

                if (confirmed == true) {
                  await controller.deleteStudent();
                  Modular.to.navigate('/home/students');
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Cor do botão de exclusão
              ),
              child: const Text('Delete Student'),
            ),
          ],
        ),
      ),
    );
  }
}
