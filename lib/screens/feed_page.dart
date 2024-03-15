import 'dart:async';

import 'package:dev_house/widgets/groups/customTile_G.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'group_detail_screen.dart';
import 'others_profile_screen.dart';

class FeedPage extends StatefulWidget {
  final void Function(int) onTabIndexChange;

  const FeedPage({Key? key, required this.onTabIndexChange}) : super(key: key);
  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage>
    with SingleTickerProviderStateMixin {
  int selectedButtonIndex = 0;
  int selectedButtonIndexg = 0;
  int selectedTabIndex = 0;
  late TabController _tabController;

  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabChange);
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

  void _handleTabChange() {
    setState(() {
      selectedTabIndex = _tabController.index;
    });
    widget.onTabIndexChange(selectedTabIndex);
  }

  Future<void> _handleRefresh() async {
    // Implement your refresh logic here
    // For example, you can fetch new data from a network or update existing data
    await Future.delayed(const Duration(seconds: 2)); // Simulating a delay
    setState(() {
      // Update state after refresh
    });
  }

  static const List<Tab> _tabs = <Tab>[
    Tab(text: 'Discussions'),
    Tab(text: 'Groups'),
  ];
  bool ti = false;
  String text = "dfdsd";
  String imageUrl = "assets/images/link.jpeg";
  bool likeb = false; // Change here
  int like = 0;
  bool showFullPost = false;
  bool _showAnimatedIconl = false;
  void doubleTap() {
    setState(() {
      // Toggle the like button
      likeb = !likeb;

      // If the like button is now selected, ensure dislike button is deselected

      _showAnimatedIconl = true;
      Timer(const Duration(milliseconds: 500), () {
        setState(() {
          _showAnimatedIconl = false;
        });
      });
    });
  }

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
                    controller: _tabController,
                    tabs: _tabs,
                    unselectedLabelColor: Colors.grey.shade700,
                    labelColor: Colors.black,
                    indicatorColor: Colors.black,
                    // onTap: (int ind) {
                    //   setState(() {
                    //     selectedTabIndex = ind;
                    //   });
                    //   widget.onTabIndexChange(selectedTabIndex);
                    // },
                  ),
                  // backgroundColor: Colors.white,
                )
              ];
            },
            body: TabBarView(
              controller: _tabController,
              children: [
                RefreshIndicator(
                  onRefresh: _handleRefresh,
                  child: Column(
                    children: [
                      Divider(
                        height: 1,
                        thickness: 8.5,
                        color: Colors.grey.shade200,
                      ),

                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const OthersProfileScreen(),
                                  ),
                                );
                              },
                              child: Container(
                                //bar
                                padding: const EdgeInsets.only(
                                  top: 8,
                                  left: 8,
                                  right: 8,
                                  bottom: 8,
                                ), //bar size
                                color: Colors.white,

                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.grey[200],
                                    ),
                                    const SizedBox(width: 12),
                                    const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Username',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.verified,
                                              color: Colors.blue,
                                              size: 16,
                                            ),
                                            Text(
                                              'Verified Professional',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.blue,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Transform.translate(
                                      offset: const Offset(9.5, 0),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const GroupDetailScreen(),
                                              ),
                                            );
                                          });
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 12,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.lightGreen[200],
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          constraints: const BoxConstraints(
                                            minWidth: 0,
                                            minHeight: 32,
                                          ),
                                          child: const Center(
                                            child: Text(
                                              'Finance',
                                              style: TextStyle(
                                                fontSize: 11,
                                                color: Colors.black,
                                                // fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Transform.translate(
                                      offset: const Offset(8,
                                          0), // Adjust the X and Y offset as needed
                                      child: IconButton(
                                        icon: const Icon(
                                          Icons.more_vert,
                                          size: 22,
                                        ),
                                        onPressed: () {
                                          // Open bottom sheet menu
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (ti == false)
                        GestureDetector(
                          onDoubleTap: () {
                            doubleTap();
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                color: Colors.grey[100],
                                padding: const EdgeInsets.only(
                                  top: 14.0,
                                  // bottom: 0, //change
                                  left: 13.5,
                                  right: 13.5,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          showFullPost = !showFullPost;
                                        });
                                      },
                                      child: Text(
                                        showFullPost
                                            ? text
                                            : _getDisplayFullPost(),
                                        style: const TextStyle(fontSize: 14.5),
                                      ),
                                    ),
                                    const SizedBox(height: 14),
                                  ],
                                ),
                              ),
                              Image.asset(imageUrl),
                            ],
                          ),
                        ),

                      // ListView for feed items
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: RefreshIndicator(
                    onRefresh: _handleRefresh,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                            left: 4.0,
                            right: 4.0,
                            bottom: 4.70,
                          ),
                          margin: const EdgeInsets.only(top: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 13,
                                height: 35,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    selectedButtonIndexg = 0;
                                  });
                                  _handleRefresh();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: selectedButtonIndexg == 0
                                      ? const Color.fromARGB(255, 211, 233, 251)
                                      : Colors.grey.shade200,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  minimumSize: const Size(0, 35),
                                  elevation: 0, // Remove the elevation shadow
                                ),
                                child: const Text(
                                  'All groups',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 13.5),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    selectedButtonIndexg = 1;
                                  });
                                  _handleRefresh();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: selectedButtonIndexg == 1
                                      ? const Color.fromARGB(255, 211, 233, 251)
                                      : Colors.grey.shade200,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  minimumSize: const Size(0, 35),
                                  elevation: 0, // Remove the elevation shadow
                                ),
                                child: const Text(
                                  'My groups',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        selectedButtonIndexg == 0
                            ? SizedBox(
                                height: MediaQuery.of(context).size.height,
                                child: ListView.builder(
                                  itemCount: 15,
                                  itemBuilder: (context, index) {
                                    return CustomTile_G(
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
                                    return CustomTile_G(
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _getDisplayFullPost() {
    const maxCharactersToShow = 300;
    if (text.length <= maxCharactersToShow) {
      return text;
    } else {
      return '${text.substring(0, maxCharactersToShow)}... see more';
    }
  }
}
