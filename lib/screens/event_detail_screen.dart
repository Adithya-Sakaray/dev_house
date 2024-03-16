import 'package:flutter/material.dart';

class EventDetailScreen extends StatelessWidget {

  final String title;
  final String startTime;
  final String endTime;
  final String type;
  final String description;
  const EventDetailScreen({super.key, required this.title, required this.startTime, required this.endTime, required this.type, required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Event Details"),
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

               Text(
                  title,
                style: const TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w700
                ),
              ),
              SizedBox(height: 5),

              Row(
                children:[
                  Icon(Icons.access_time_outlined, size: 35,),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                    child: Text("${startTime.substring(0,10)} - ${endTime.substring(0,10)}"),
                  ),
                ]
              ),

              SizedBox(height: 5),

              Row(
                  children:[
                    iconContainer("hackathon"),
                    Padding(
                      padding:
                       const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                      child: Text("Hackathon"),
                    ),
                  ]
              ),
              SizedBox(height: 10),

              Text(
                  "lorenv vkdvnd vvofvnd dfvoidvdv  idvnd vovihvidv vdovfi fvndfv ofvfvnv vdofvihfd vdfvninf ofdivhffn oihvfivhfd vfihvfv ihvfvidfv",
                style: TextStyle(
                  fontSize: 16
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget iconContainer(String typeOfEvent) {
    var iconData;
    if(typeOfEvent == "hackathon"){
      iconData = Icons.lightbulb_outline;
    } else if (typeOfEvent == "contests"){
      iconData = Icons.assignment;
    } else {
      iconData = Icons.people;
    }
    return Icon(iconData,size: 35,);
  }
}
