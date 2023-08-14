import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:light_test/core/fonts_and_colors.dart';
import 'package:light_test/core/injection.dart';
import 'package:light_test/core/widgets/buttons.dart';
import 'package:light_test/core/widgets/logo.dart';
import 'package:light_test/features/home/bloc/events_bloc.dart';
import 'package:light_test/features/home/bloc/news_bloc.dart';
import 'package:light_test/features/home/pages/events_page.dart';
import 'package:light_test/features/home/pages/news_page.dart';
import 'package:light_test/features/main/models/view_config.dart';

const homeViewConfig = ViewConfig.selectable(
  title: 'главная',
  view: HomeView(),
  image: 'assets/images/home.png',
  imageSelected: 'assets/images/home_selected.png',
);

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _AppBar(),
        Expanded(child: _PagesView()),
      ],
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          children: [
            const Logo(),
            const Spacer(),
            SimpleButton(
              isExpand: false,
              color: grey4,
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Text('О фонде', style: labelLarge.copyWith(color: black)),
              onPressed: () {},
            ),
            const SizedBox(width: 6),
            Badge(
              label: const Text('3', style: labelSmall),
              largeSize: 20,
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: SimpleButton(
                isExpand: false,
                color: grey4,
                padding: const EdgeInsets.all(8),
                child: Image.asset('assets/images/bell.png'),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PagesView extends StatefulWidget {
  const _PagesView();

  @override
  State<_PagesView> createState() => _PagesViewState();
}

class _PagesViewState extends State<_PagesView> {
  var _selectedSegment = 0;

  Widget get _selectedChild {
    if (_selectedSegment == 0) {
      return BlocProvider(
        create: (_) => getIt<EventsBloc>(),
        child: const EventsPage(),
      );
    }

    if (_selectedSegment == 1) {
      return BlocProvider(
        create: (_) => getIt<NewsBloc>(),
        child: const NewsPage(),
      );
    }

    throw Exception();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: SizedBox(
            width: double.infinity,
            child: CupertinoSlidingSegmentedControl<int>(
              groupValue: _selectedSegment,
              onValueChanged: (value) {
                if (value != null) {
                  setState(() {
                    _selectedSegment = value;
                  });
                }
              },
              children: <int, Widget>{
                0: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Text(
                    'Мероприятия',
                    style: labelSmall2.copyWith(color: black),
                  ),
                ),
                1: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Text(
                    'Новости',
                    style: labelSmall2.copyWith(color: black),
                  ),
                ),
              },
            ),
          ),
        ),
        Expanded(child: _selectedChild),
      ],
    );
  }
}
