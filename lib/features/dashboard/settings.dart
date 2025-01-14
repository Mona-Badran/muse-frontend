import 'package:flutter/material.dart';
import 'package:muse/shared/customAppBar.dart';
import 'package:muse/shared/customBottomNavBar.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Settings",
        onAvatarTap: () {
          print('Avatar tapped');
        },
      ),
    );
  }
}
