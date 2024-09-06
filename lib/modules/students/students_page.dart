import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_vr_flutter/core/widgets/error_card.dart';
import 'package:teste_vr_flutter/modules/students/students_controller.dart';

class StudentsPage extends StatelessWidget {
  StudentsPage({super.key});

  final controller = StudentsController(Modular.get());

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isSmall = width < 700;
    searchController.addListener(
      () {
        controller.searching = true;
        controller.search(searchController.text);
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Students"),
        centerTitle: isSmall,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Observer(
              builder: (_) {
                if (controller.error != null) {
                  Future.delayed(const Duration(seconds: 3), () {
                    controller.error = null;
                  });
                  return ErrorCard(errorMessage: controller.error!);
                }
                return Container(); // Retorne um widget vazio se não houver erro
              },
            ),
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                suffixIcon: Observer(builder: (context) {
                  return Visibility(
                      visible: controller.searching,
                      child: IconButton(
                        onPressed: () async {
                          searchController.text = '';
                          await controller.clear();
                        },
                        icon: const Icon(Icons.close),
                      ));
                }),
                prefixIcon: const Icon(Icons.search),
                hintText: "Search students",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "All students",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Observer(builder: (context) {
                  return DataTable(
                    columns: const [
                      DataColumn(label: Text("Name")),
                      DataColumn(label: Text("Code")),
                      DataColumn(label: Text("Actions")),
                    ],
                    rows: controller.filteredStudents
                        .map(
                          (student) => DataRow(
                            cells: [
                              DataCell(Text(student.nome)),
                              DataCell(Text("${student.code}")),
                              DataCell(
                                TextButton(
                                  onPressed: () {
                                    Modular.to.navigate("/home/students/create",
                                        arguments: student);
                                  },
                                  child: const Text("Edit"),
                                ),
                              ),
                            ],
                          ),
                        )
                        .toList(),
                  );
                }),
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Action for adding a new student
                  Modular.to.navigate("/home/students/create");
                },
                icon: const Icon(Icons.add),
                label: const Text("Add student"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
