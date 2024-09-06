import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StudentsPage extends StatefulWidget {
  const StudentsPage({super.key});

  @override
  State<StudentsPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentsPage> {
  final List<Map<String, String>> students = [
    {"name": "Katherine Smith", "courses": "Intro to Python"},
    {"name": "John Doe", "courses": "Intro to Python, Advanced Python"},
    {"name": "Lauren Johnson", "courses": "Intro to Python"},
    {"name": "Michael Brown", "courses": "Advanced Python"},
    {"name": "Emily Davis", "courses": "Intro to Python"},
  ];

  List<Map<String, String>> filteredStudents = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredStudents = students;
    searchController.addListener(() {
      filterStudents();
    });
  }

  void filterStudents() {
    final query = searchController.text.toLowerCase();
    setState(() {
      filteredStudents = students
          .where((student) => student["name"]!.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isSmall = width < 700;
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
            TextField(
              controller: searchController,
              decoration: InputDecoration(
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
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text("Name")),
                    DataColumn(label: Text("Courses")),
                    DataColumn(label: Text("Actions")),
                  ],
                  rows: filteredStudents
                      .map(
                        (student) => DataRow(
                          cells: [
                            DataCell(Text(student["name"]!)),
                            DataCell(Text(student["courses"]!)),
                            DataCell(
                              TextButton(
                                onPressed: () {
                                  // Implement the action for editing the student
                                },
                                child: const Text("Edit"),
                              ),
                            ),
                          ],
                        ),
                      )
                      .toList(),
                ),
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
