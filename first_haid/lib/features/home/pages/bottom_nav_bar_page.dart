import 'package:first_haid/features/home/pages/health_page.dart';
import 'package:first_haid/features/home/pages/home.dart';
import 'package:first_haid/features/home/pages/hospitals_page.dart';
import 'package:first_haid/features/home/pages/profile_page.dart';
import 'package:flutter/material.dart';

class BottomNavBarPage extends StatefulWidget {
  const BottomNavBarPage({super.key});

  @override
  State<BottomNavBarPage> createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  int currentIndex = 0;

  final List _pages = [
    const HomePage(),
    const HealthPage(),
    const ProfilePage(),
    const HospitalsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Image.asset(
              'assets/icons/homeIcon.png',
              height: 22,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Health',
            icon: Image.asset(
              'assets/icons/heartIcon.png',
              height: 22,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Hospitals',
            icon: Image.asset(
              'assets/icons/mapsIcon.png',
              height: 22,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Image.asset(
              'assets/icons/profileIcon.png',
              height: 22,
            ),
          ),
        ],
      ),
    );
  }
}
