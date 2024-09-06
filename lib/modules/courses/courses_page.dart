import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({super.key});

  @override
  _CoursesPageState createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> courses = [
    {
      "name": "Introduction to Flutter",
      "description": "Learn the basics of Flutter"
    },
    {"name": "Advanced Dart", "description": "Deep dive into Dart programming"},
    {
      "name": "UI Design Principles",
      "description": "Learn how to design responsive UIs"
    },
    {
      "name": "State Management",
      "description": "Manage state effectively in Flutter"
    },
    {
      "name": "Database Integration",
      "description": "Integrate Flutter with SQLite and Firebase"
    },
  ];

  List<Map<String, String>> filteredCourses = [];

  @override
  void initState() {
    super.initState();
    filteredCourses = courses;

    _searchController.addListener(() {
      filterCourses();
    });
  }

  void filterCourses() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredCourses = courses
          .where((course) =>
              course["name"]!.toLowerCase().contains(query) ||
              course["description"]!.toLowerCase().contains(query))
          .toList();
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
              child: filteredCourses.isNotEmpty
                  ? ListView.builder(
                      itemCount: filteredCourses.length,
                      itemBuilder: (context, index) {
                        final course = filteredCourses[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: ListTile(
                            title: Text(course["name"]!),
                            subtitle: Text(course["description"]!),
                            trailing: IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                // Ação ao editar o curso
                              },
                            ),
                          ),
                        );
                      },
                    )
                  : const Center(
                      child: Text(
                        'No courses found',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Action for adding a new student
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
