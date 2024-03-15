import 'package:dev_house/screens/event_detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/Events/event_container.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => EventDetailScreen()));
                },
                  child: const EventContainer()
              ),
              const SizedBox(height: 10),
              GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => EventDetailScreen()));
                  },
                  child: const EventContainer()
              ),
              const SizedBox(height: 10),
              GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => EventDetailScreen()));
                  },
                  child: const EventContainer()
              ),
              const SizedBox(height: 10),
              GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => EventDetailScreen()));
                  },
                  child: const EventContainer()
              ),
              const SizedBox(height: 10),
              GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => EventDetailScreen()));
                  },
                  child: const EventContainer()
              ),

            ],
          ),
        ),
      ),
    );
  }
}
