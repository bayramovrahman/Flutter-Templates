import 'package:flutter/material.dart';
import 'package:simple_navigation_bottom/pages/add_photo_page.dart';
import 'package:simple_navigation_bottom/pages/home_page.dart';
import 'package:simple_navigation_bottom/pages/profile_page.dart';
import 'package:simple_navigation_bottom/pages/search_page.dart';
import 'package:simple_navigation_bottom/pages/settings_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> pages = [
    const AddPhotoPage(),
    const SearchPage(),
    const HomePage(),
    const SettingsPage(),
    const ProfilePage(),
  ];

  int currentPage = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          "Bottom Navigation",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.add_a_photo),
            label: "Add Photo",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
