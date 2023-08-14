import 'package:flutter/material.dart';
import 'package:light_test/features/main/models/view_config.dart';

const profileViewConfig = ViewConfig.selectable(
  title: 'мой профиль',
  view: ProfileView(),
  image: 'assets/images/profile.png',
  imageSelected: 'assets/images/profile_selected.png',
);

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'profile',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
