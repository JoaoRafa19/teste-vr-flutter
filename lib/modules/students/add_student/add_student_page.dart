import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_vr_flutter/modules/students/add_student/add_student_controller.dart';

class AddStudentPage extends StatelessWidget {
  AddStudentPage({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();

  final controller = Modular.get<AddStudentController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton.outlined(
            onPressed: () {
              Modular.to.navigate('/home/students');
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text('Add Student'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Campo de entrada para o nome
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

              // Botão para adicionar o estudante
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final String name = _nameController.text;

                      // Ação para salvar o estudante com o nome fornecido
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Student $name added successfully!'),
                        ),
                      );

                      // Resetar o campo de nome
                      _nameController.clear();
                    }
                  },
                  child: const Text('Add Student'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
