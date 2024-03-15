import 'package:dev_house/screens/event_screen.dart';
import 'package:dev_house/widgets/NavigationBar.dart';
import 'package:dev_house/widgets/drawer.dart';
import 'package:dev_house/widgets/floating.dart';
import 'package:flutter/material.dart';
import 'feed_page.dart';
import 'job_screen.dart';
import 'profile_screen.dart';
import 'group_screen.dart';
import '../widgets/appBar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomeScreen> {
  int _selectedNavIndex = 0;
  int _selectedTabIndex = 0;
  final Color _selectedColor = const Color.fromARGB(255, 7, 42, 240);

  void _onItemTapped(int index) {
    setState(() {
      _selectedNavIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: app(
        context,
        _selectedNavIndex,
      ),
      drawer: _selectedNavIndex == 0
          ? draw(
              context,
            )
          : null,
      body: _selectedNavIndex == 0
          ? FeedPage(
              onTabIndexChange: (index) {
                setState(() {
                  _selectedTabIndex = index;
                });
              },
            )
          : _selectedNavIndex == 1
              ? const GroupScreen()
              : _selectedNavIndex == 2
                  ? JobScreen(
                      onTabIndexChange: (index) {
                        setState(() {
                          _selectedTabIndex = index;
                        });
                      },
                    )
                  : _selectedNavIndex == 3
                      ? const EventScreen()
                      : _selectedNavIndex == 4
                          ? const ProfileScreen()
                          : Container(),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedNavIndex,
        selectedColor: _selectedColor,
        onItemTapped: _onItemTapped,
      ),
      floatingActionButton: float(
        context,
        _selectedNavIndex,
        _selectedTabIndex,
      ),
    );
  }
}
