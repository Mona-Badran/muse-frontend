import 'package:flutter/material.dart';
import 'package:muse/features/artwork/cameraPage.dart';
import '../features/galleries/allGalleries.dart';
import '../features/dashboard/profile.dart';
import '../features/dashboard/settings.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    AllGalleries(),
    MapPage(),
    CameraPage(),
    SettingsPage(),
    EditProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xFF749495),
          unselectedItemColor: Colors.white70,
          selectedItemColor: Color(0xFF4C6060),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.photo_library_outlined),
              label: 'Galleries',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.pin_drop_outlined),
              label: 'Map',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt_outlined),
              label: 'Capture',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: 'Settings',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ]),
    );
  }
}

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Map Page"));
  }
}

