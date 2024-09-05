import 'package:flutter/material.dart';

class AddStudentPage extends StatefulWidget {
  const AddStudentPage({super.key});

  @override
  AddStudentPageState createState() => AddStudentPageState();
}

class AddStudentPageState extends State<AddStudentPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
