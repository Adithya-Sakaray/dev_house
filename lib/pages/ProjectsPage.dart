import 'package:dev_house/widgets/appBar.dart';
import 'package:flutter/material.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: app(context),
      body: const Center(
        child: Text('Projects Page'),
      ),
    );
  }
}
