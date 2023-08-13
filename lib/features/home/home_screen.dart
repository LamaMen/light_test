import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreenRoute extends CupertinoPageRoute {
  HomeScreenRoute() : super(builder: (context) => const HomeScreen());
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
