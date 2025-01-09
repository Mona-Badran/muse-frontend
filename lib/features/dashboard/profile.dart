import 'package:flutter/material.dart';
import 'package:muse/shared/customBottomNavBar.dart';
import '../galleries/allGalleries.dart';
import '../../shared/customAppBar.dart';
import '../../shared/customButton.dart';

class EditProfilePage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController bioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(
        title: "Profile",
        onAvatarTap: () {
        print('Avatar tapped');
      },
        avatarUrl: null,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  print("Change profile picture tapped!");
                },
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/profile_placeholder.png'),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[300],
                      radius: 15,
                      child: Icon(
                        Icons.camera_alt_outlined,
                        size: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Name",
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
