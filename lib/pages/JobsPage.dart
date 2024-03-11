import 'package:dev_house/widgets/appBar.dart';
import 'package:flutter/material.dart';

class JobsPage extends StatelessWidget {
  const JobsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: app(context),
      body: const Center(
        child: Text('Jobs Page'),
      ),
    );
  }
}
