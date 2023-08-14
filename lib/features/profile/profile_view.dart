import 'package:flutter/material.dart';
import 'package:light_test/features/main/models/view_config.dart';
import 'package:light_test/features/profile/widgets/my_profile_view.dart';

const profileViewConfig = ViewConfig.selectable(
  title: 'мой профиль',
  view: ProfileView(),
  image: 'assets/images/profile.png',
  imageSelected: 'assets/images/profile_selected.png',
);

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_navigatorKey.currentState != null) {
          await _navigatorKey.currentState!.maybePop();
          return false;
        }

        return true;
      },
      child: Navigator(
        key: _navigatorKey,
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(
            builder: (_) => const MyProfileView(),
            settings: settings,
          );
        },
      ),
    );
  }
}
