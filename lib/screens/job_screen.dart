import 'package:dev_house/widgets/jobs/customTile_J.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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



  List<bool> chip = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
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
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return const CustomTile_J(
                      title: 'Design',
                      subtitle: '34554' " members",
                      description: 'Talk, vibe, relax, repeat. Do whatever you',
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

