import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final leading = SizedBox(
      width: MediaQuery.of(context).size.width * 0.3,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ListTile(
              title: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(8),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.home_rounded),
                    SizedBox(width: 20 ),
                    Text('Dashboards'),
                  ],
                ),
              ),
              onTap: () => Modular.to.navigate('/home/dashboard'),
            ),
            ListTile(
              title: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(8),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.people),
                    SizedBox(width: 20 ),
                    Text('Students'),
                  ],
                ),
              ),
              onTap: () => Modular.to.navigate('/home/page2'),
            ),
            ListTile(
              title: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(8),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.home_rounded),
                    SizedBox(width: 20 ),
                    Text('Courses'),
                  ],
                ),
              ),
              onTap: () => Modular.to.navigate('/home/page1'),
            ),
            ListTile(
              title: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(8),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.home_rounded),
                    SizedBox(width: 20 ),
                    Text('Instructors'),
                  ],
                ),
              ),
              onTap: () => Modular.to.navigate('/home/page1'),
            ),
            ListTile(
              title: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(8),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.home_rounded),
                    SizedBox(width: 20 ),
                    Text('Evaluations'),
                  ],
                ),
              ),
              onTap: () => Modular.to.navigate('/home/page1'),
            ),
            ListTile(
              title: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(8),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  
                  children: [
                    Icon(Icons.home_rounded),
                    SizedBox(width: 20 ),
                    Text('Settings'),
                  ],
                ),
              ),
              onTap: () => Modular.to.navigate('/home/page1'),
            ),
            
          ],
        ),
      ),
    );

    return Scaffold(
      body: Row(
        children: [
          leading,
          Container(width: 1, color: Colors.black45),
          const Expanded(child: RouterOutlet()),
        ],
      ),
    );
  }
}

