import 'package:dev_house/widgets/NavigationBar.dart';
import 'package:dev_house/widgets/drawer.dart';
import 'package:flutter/material.dart';
import '../widgets/CreatePostPage.dart';
import 'EventsPage.dart';
import '../widgets/FeedPage.dart';
import 'JobsPage.dart';
import 'ProfilePage.dart';
import 'ProjectsPage.dart';
import '../widgets/appBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final Color _selectedColor = const Color.fromARGB(255, 7, 42, 240);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: app(
        context,
        _selectedIndex,
      ),
      drawer: _selectedIndex == 0
          ? draw(
              context,
            )
          : null,
      body: _selectedIndex == 0
          ? const FeedPage()
          : _selectedIndex == 1
              ? const ProjectsPage()
              : _selectedIndex == 2
                  ? const JobsPage()
                  : _selectedIndex == 3
                      ? const EventsPage()
                      : _selectedIndex == 4
                          ? const ProfilePage()
                          : Container(),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        selectedColor: _selectedColor,
        onItemTapped: _onItemTapped,
      ),
      floatingActionButton: _selectedIndex == 0
          ? Container(
              margin: const EdgeInsets.only(
                bottom: 15.0,
                right: 3.0,
              ), // Add negative margin to lift the button above the bottom navigation bar
              child: FloatingActionButton(
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
                backgroundColor: const Color.fromARGB(255, 7, 42, 240),
                child: SizedBox(
                  height: 28,
                  width: 28,
                  child: Image.asset(
                    "assets/icons/floating.png",
                    color: const Color.fromARGB(255, 248, 245, 245),
                  ),
                ),
              ),
            )
          : null,
    );
  }
}
