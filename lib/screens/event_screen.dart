import 'package:dev_house/Controller/event_controller.dart';
import 'package:dev_house/screens/event_detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/Events/event_container.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final EventController eventController = Get.find<EventController>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView.separated(
              itemCount: eventController.eventList.length,
                separatorBuilder: (context, index) {
                  return SizedBox(height: 10,);
                },
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>
                          EventDetailScreen(
                              title: eventController.eventList[index]["title"],
                              startTime: eventController.eventList[index]["startTime"],
                              endTime: eventController.eventList[index]["endTime"],
                              type: eventController.eventList[index]["type"],
                              description: eventController.eventList[index]["description"])));
                    },
                    child: EventContainer(
                        title: eventController.eventList[index]["title"],
                        startTime: eventController.eventList[index]["startTime"],
                        type: eventController.eventList[index]["type"]),
                  );
                }
            ),
          ),
        ),
      ),
    );
  }
}
