import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  int selectedButtonIndex = 0;
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

  static const List<Tab> _tabs = <Tab>[
    Tab(text: 'Discussions'),
    Tab(text: 'Groups'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        body: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (context, _) {
            return [
              const SliverAppBar(
                pinned: true,
                title: TabBar(
                  tabs: _tabs,
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              // Discussions Tab
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 8.0, bottom: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectedButtonIndex = 0;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: selectedButtonIndex == 0
                                ? const Color.fromARGB(255, 149, 203, 247)
                                : Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            minimumSize: const Size(0, 35),
                          ),
                          child: const Text('For You'),
                        ),
                        const SizedBox(width: 16),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectedButtonIndex = 1;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: selectedButtonIndex == 1
                                ? const Color.fromARGB(255, 149, 203, 247)
                                : Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            minimumSize: const Size(0, 35),
                          ),
                          child: const Text('Trending'),
                        ),
                        const SizedBox(width: 16),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectedButtonIndex = 2;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: selectedButtonIndex == 2
                                ? const Color.fromARGB(255, 149, 203, 247)
                                : Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            minimumSize: const Size(0, 35),
                          ),
                          child: const Text('Latest'),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 4.5,
                    thickness: 7,
                    color: Colors.grey.shade200,
                  ),
                  // ListView for feed items
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: _handleRefresh,
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              elevation: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Post Title $index',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    const Text(
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod ipsum sed metus placerat, vel viverra urna aliquet. Nam luctus arcu a lorem fermentum, nec pretium neque commodo.',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    const SizedBox(height: 8),
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'John Doe',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          '2 hours ago',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    const Row(
                                      children: [
                                        Icon(Icons.thumb_up),
                                        SizedBox(width: 4),
                                        Text('15 Likes'),
                                        SizedBox(width: 16),
                                        Icon(Icons.chat_bubble),
                                        SizedBox(width: 4),
                                        Text('10 Comments'),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              // Clubs Tab
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 8.0, bottom: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectedButtonIndex = 0;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: selectedButtonIndex == 0
                                ? const Color.fromARGB(255, 149, 203, 247)
                                : Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            minimumSize: const Size(0, 35),
                          ),
                          child: const Text('All groups'),
                        ),
                        const SizedBox(width: 16),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectedButtonIndex = 1;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: selectedButtonIndex == 1
                                ? const Color.fromARGB(255, 149, 203, 247)
                                : Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            minimumSize: const Size(0, 35),
                          ),
                          child: const Text('My groups'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
