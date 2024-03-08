import 'package:flutter/material.dart';
import 'CreatePostPage.dart';
import 'NotificationsPage.dart';
import 'JobsPage.dart';
import 'MessagesPage.dart';
import 'EventsPage.dart';
import 'ProfilePage.dart';
import 'SearchPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  int _selectedTabIndex = 0; // Index for the selected tab
  static final List<Widget> _widgetOptions = <Widget>[
    const FeedPage(),
    const JobsPage(),
    const MessagesPage(),
    const EventsPage(),
    const ProfilePage(),
  ];

  static const List<Tab> _tabs = <Tab>[
    Tab(text: 'For You'),
    Tab(text: 'Trending'),
    Tab(text: 'Latest'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Job Portal'),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SearchPage()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NotificationsPage()),
                );
              },
            ),
          ],
          bottom: TabBar(
            tabs: _tabs,
            onTap: (index) {
              setState(() {
                _selectedTabIndex = index;
              });
            },
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
                child: const Text(
                  'Drawer Header',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                title: const Text('Item 1'),
                onTap: () {
                  // Update UI based on item 1 selection
                },
              ),
              ListTile(
                title: const Text('Item 2'),
                onTap: () {
                  // Update UI based on item 2 selection
                },
              ),
              // Add more list items as needed
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: [
                  // For You tab
                  _selectedTabIndex == 0
                      ? ListView.builder(
                          itemCount: 10, // Assuming 10 feed items
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                elevation: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            style:
                                                TextStyle(color: Colors.grey),
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
                        )
                      : Container(), // Empty container for other tabs
                  // Trending tab
                  _selectedTabIndex == 1
                      ? const Center(child: Text('Trending'))
                      : Container(), // Empty container for other tabs
                  // Latest tab
                  _selectedTabIndex == 2
                      ? const Center(child: Text('Latest'))
                      : Container(), // Empty container for other tabs
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.work),
              label: 'Jobs',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: 'Messages',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.event),
              label: 'Events',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
        ),
        floatingActionButton: _selectedIndex == 0
            ? FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreatePostPage()),
                  );
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: const Icon(Icons.add),
              )
            : null,
      ),
    );
  }
}

class FeedPage extends StatelessWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10, // Assuming 10 feed items
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
    );
  }
}
