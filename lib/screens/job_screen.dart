import 'package:dev_house/Controller/job_controller.dart';
import 'package:dev_house/widgets/jobs/customTile_J.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'job_detail_screen.dart';

class JobScreen extends StatefulWidget {
  const JobScreen({Key? key}) : super(key: key);
  @override
  State<JobScreen> createState() => _JobsPageState();
}

class _JobsPageState extends State<JobScreen>
    with SingleTickerProviderStateMixin {
  int selectedButtonIndex = 0;
  int selectedTabIndex = 0;

  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        setState(() {});
      } else if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        setState(() {});
      }
    });
  }

  Future<void> _handleRefresh() async {
    // Implement your refresh logic here
    // For example, you can fetch new data from a network or update existing data
    await Future.delayed(const Duration(seconds: 2)); // Simulating a delay
    setState(() {
      // Update state after refresh
    });
  }


  @override
  Widget build(BuildContext context) {

    final JobController jobController = Get.find<JobController>();

    return Scaffold(
      body: SingleChildScrollView(
        child: RefreshIndicator(
          onRefresh: _handleRefresh,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 32,
                  bottom: 6.0,
                  top: 5.8,
                ),
                child: Text(
                  "EXPLORE GIGS",
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  itemCount: jobController.jobsList.length,
                  itemBuilder: (context, index) {
                    return  Obx((){
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder:
                                      (context)=>
                                      JobDetailScreen(
                                          companyName: jobController.jobsList[index]["companyName"],
                                          role: jobController.jobsList[index]["title"],
                                          type: jobController.jobsList[index]["type"],
                                          location: jobController.jobsList[index]["location"],
                                          skills: jobController.jobsList[index]["skillsRequired"],
                                          jobDesc: jobController.jobsList[index]["description"],
                                          companyDesc: jobController.jobsList[index]["companyDescription"]
                                      )));
                        },
                        child: CustomTile_J(
                          title: jobController.jobsList[index]["title"],
                          companyName: jobController.jobsList[index]["companyName"],
                          type: jobController.jobsList[index]["type"],
                          location: jobController.jobsList[index]["location"],
                        ),
                      );
                    },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
      backgroundColor: Colors.grey.shade50,
    );
  }
}

