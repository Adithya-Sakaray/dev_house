import 'package:dev_house/widgets/appBar.dart';
import 'package:flutter/material.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: app(context),
      body: const Center(
        child: Text('Events Page'),
      ),
    );
  }
}
