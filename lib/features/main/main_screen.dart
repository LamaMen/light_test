import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:light_test/core/fonts_and_colors.dart';
import 'package:light_test/features/home/home_view.dart';
import 'package:light_test/features/main/models/view_config.dart';
import 'package:light_test/features/profile/profile_view.dart';

class MainScreenRoute extends CupertinoPageRoute {
  MainScreenRoute() : super(builder: (context) => const MainScreen());
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var currentView = 0;
  final List<ViewConfig> views = [
    homeViewConfig,
    const ViewConfig.unselectable(
      title: 'мероприятия',
      image: 'assets/images/calendar.png',
    ),
    const ViewConfig.unselectable(
      title: 'чат',
      image: 'assets/images/message.png',
    ),
    profileViewConfig,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: views[currentView].view!),
            SizedBox(
              height: 54,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: views.mapIndexed((i, v) {
                  return _NavigationItem(
                    viewConfig: v,
                    isSelected: i == currentView,
                    onPressed: () {
                      if (i == 1 || i == 2) return;
                      setState(() {
                        currentView = i;
                      });
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavigationItem extends StatelessWidget {
  const _NavigationItem({
    required this.viewConfig,
    required this.isSelected,
    required this.onPressed,
  });

  final ViewConfig viewConfig;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (viewConfig.isSelectable) onPressed();
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: Image.asset(
              isSelected ? viewConfig.imageSelected! : viewConfig.image,
            ),
          ),
          Text(
            viewConfig.title,
            style: labelSmall2.copyWith(color: isSelected ? black : grey),
          ),
          if (isSelected) ...[
            Container(
              height: 8,
              width: 8,
              decoration: const BoxDecoration(
                color: primary,
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
            ),
          ]
        ],
      ),
    );
  }
}
