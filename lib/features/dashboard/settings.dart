import 'package:flutter/material.dart';
import 'package:muse/shared/customAppBar.dart';

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
      ),body: ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        // Account Section
        const SettingsSectionTitle(title: "Account"),
        SettingsItem(
          icon: Icons.person,
          title: "Edit Profile",
          onTap: () {
            print("Edit Profile clicked");
          },
        ),
        SettingsItem(
          icon: Icons.lock,
          title: "Change Password",
          onTap: () {
            print("Change Password clicked");
          },
        ),
        const Divider(),

        const SettingsSectionTitle(title: "Notifications"),
        SettingsItem(
          icon: Icons.notifications,
          title: "Push Notifications",
          trailing: Switch(
            value: true,
            onChanged: (value) {
              print("Push Notifications toggled: $value");
            },
          ),
        ),
        const Divider(),

        const SettingsSectionTitle(title: "Preferences"),
        SettingsItem(
          icon: Icons.palette,
          title: "Theme",
          onTap: () {
            print("Theme clicked");
          },
        ),
        SettingsItem(
          icon: Icons.language,
          title: "Language",
          onTap: () {
            print("Language clicked");
          },
        ),
        const Divider(),

        const SettingsSectionTitle(title: "Support"),
        SettingsItem(
          icon: Icons.help_outline,
          title: "Help Center",
          onTap: () {
            print("Help Center clicked");
          },
        ),
        SettingsItem(
          icon: Icons.info_outline,
          title: "About",
          onTap: () {
            print("About clicked");
          },
        ),
        const Divider(),

        const SizedBox(height: 20),
        Center(
          child: ElevatedButton(
            onPressed: () {
              // Add logout logic
              print("Logged out");
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF749495),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
            ),
            child: const Text(
              "Logout",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    ),
    );
  }
}

class SettingsItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;

  const SettingsItem({
    required this.icon,
    required this.title,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.black87),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 16,
        ),
      ),
      trailing: trailing ?? const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}

class SettingsSectionTitle extends StatelessWidget {
  final String title;

  const SettingsSectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: Text(
        title.toUpperCase(),
        style: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.black54,
        ),
      ),
    );
  }
}