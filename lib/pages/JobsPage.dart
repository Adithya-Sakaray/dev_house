import 'package:dev_house/widgets/jobs/customTile_J.dart';
import 'package:dev_house/widgets/relevance.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class JobsPage extends StatefulWidget {
  final void Function(int) onTabIndexChange;

  const JobsPage({Key? key, required this.onTabIndexChange}) : super(key: key);
  @override
  State<JobsPage> createState() => _JobsPageState();
}

class _JobsPageState extends State<JobsPage> {
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

  String selectedSortOptionText = 'Relevance';
  void updateSelectedOption(SortOption option) {
    setState(() {
      selectedSortOptionText =
          option == SortOption.Relevance ? 'Relevance' : 'Latest';
    });
  }

  List<bool> chip = [false, false, false, false];
  static const List<Tab> _tabs = <Tab>[
    Tab(text: 'Explore gigs'),
    Tab(text: 'My gigs'),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: SafeArea(
        child: Scaffold(
          body: NestedScrollView(
            controller: _scrollController,
            headerSliverBuilder: (context, _) {
              return [
                SliverAppBar(
                  pinned: true,
                  title: TabBar(
                    tabs: _tabs,
                    unselectedLabelColor: Colors.grey.shade700,
                    labelColor: Colors.black,
                    indicatorColor: Colors.black,
                    onTap: (int ind) {
                      setState(() {
                        selectedTabIndex = ind;
                      });
                      widget.onTabIndexChange(selectedTabIndex);
                    },
                  ),
                  // backgroundColor: Colors.white,
                ),
              ];
            },
            body: TabBarView(
              children: [
                SingleChildScrollView(
                  child: RefreshIndicator(
                    onRefresh: _handleRefresh,
                    child: Column(
                      children: [
                        Transform.translate(
                          offset: const Offset(-125,
                              20.0), // Adjust the X and Y offset as needed
                          child: Padding(
                            padding: const EdgeInsets.only(
                              bottom: 16.0,
                              top: 0.8,
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
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                            left: 4.0,
                            right: 4.0,
                            bottom: 4.70,
                          ),
                          margin: const EdgeInsets.only(top: 10.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  width: 13,
                                  height: 35,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    _relBottomSheet(
                                        context, updateSelectedOption);
                                    _handleRefresh();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color.fromARGB(
                                        255, 211, 233, 251),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    minimumSize: const Size(0, 35),
                                    elevation: 0, // Remove the elevation shadow
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Add your relevance icon here
                                      Text(
                                        selectedSortOptionText,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Transform.translate(
                                        offset: const Offset(5,
                                            -0.5), // Adjust the vertical offset as needed
                                        child: const Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      chip[0] = !chip[0];
                                    });
                                    _handleRefresh();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: chip[0]
                                        ? const Color.fromARGB(
                                            255, 211, 233, 251)
                                        : Colors.grey.shade200,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    minimumSize: const Size(0, 35),
                                    elevation: 0, // Remove the elevation shadow
                                  ),
                                  child: const Text(
                                    'Full-time',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      chip[1] = !chip[1];
                                    });
                                    _handleRefresh();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: chip[1]
                                        ? const Color.fromARGB(
                                            255, 211, 233, 251)
                                        : Colors.grey.shade200,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    minimumSize: const Size(0, 35),
                                    elevation: 0, // Remove the elevation shadow
                                  ),
                                  child: const Text(
                                    'Paid',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      chip[2] = !chip[2];
                                    });
                                    _handleRefresh();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: chip[2]
                                        ? const Color.fromARGB(
                                            255, 211, 233, 251)
                                        : Colors.grey.shade200,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    minimumSize: const Size(0, 35),
                                    elevation: 0, // Remove the elevation shadow
                                  ),
                                  child: const Text(
                                    'Internship',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      chip[3] = !chip[3];
                                    });
                                    _handleRefresh();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: chip[3]
                                        ? const Color.fromARGB(
                                            255, 211, 233, 251)
                                        : Colors.grey.shade200,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    minimumSize: const Size(0, 35),
                                    elevation: 0, // Remove the elevation shadow
                                  ),
                                  child: const Text(
                                    'Freelance',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 6.75),
                              ],
                            ),
                          ),
                        ),
                        selectedButtonIndex == 0
                            ? SizedBox(
                                height: MediaQuery.of(context).size.height,
                                child: ListView.builder(
                                  itemCount: 15,
                                  itemBuilder: (context, index) {
                                    return CustomTile_J(
                                      title: 'Design',
                                      subtitle: '34554' " members",
                                      description:
                                          'Talk, vibe, relax, repeat. Do whatever you',
                                      onPressed: () {
                                        // Action to perform when button is pressed
                                      },
                                    );
                                  },
                                ),
                              )
                            : SizedBox(
                                height: MediaQuery.of(context).size.height,
                                child: ListView.builder(
                                  itemCount: 4,
                                  itemBuilder: (context, index) {
                                    return CustomTile_J(
                                      title: 'Finance',
                                      subtitle: '2354' " members",
                                      description:
                                          'Talk, vibe, relax, repeat. Do whatever you',
                                      onPressed: () {
                                        // Action to perform when button is pressed
                                      },
                                    );
                                  },
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
                RefreshIndicator(
                  onRefresh: _handleRefresh,
                  child: const Column(
                    children: [
                      Text("ex"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void _relBottomSheet(
    BuildContext context, void Function(SortOption) updateSelectedOption) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
    ),
    backgroundColor: const Color.fromARGB(255, 253, 249, 249),
    builder: (BuildContext context) {
      return RelevanceBottomSheet(updateSelectedOption: updateSelectedOption);
    },
  );
}
