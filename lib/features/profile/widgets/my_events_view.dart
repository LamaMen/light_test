import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:light_test/core/fonts_and_colors.dart';
import 'package:light_test/features/profile/models/my_event.dart';

class MyEventsViewRoute extends CupertinoPageRoute {
  MyEventsViewRoute() : super(builder: (_) => const MyEventsView());
}

class MyEventsView extends StatelessWidget {
  const MyEventsView({super.key});

  @override
  Widget build(BuildContext context) {
    return _EventsListView(
      events: const [
        MyEvent(
          title: 'Петербургский международный экономический форум',
          role: 'дирекция и тех персонал',
          dates: '18 - 23 фев',
        ),
        MyEvent(
          title: 'Восточный экономический форум',
          role: 'дирекция и тех персонал',
          dates: '18 - 23 фев',
        ),
      ],
      title: 'мои мероприятия',
      toolBarButton: GestureDetector(
        onTap: () {
          Navigator.push(context, MyEventsArchiveViewRoute());
        },
        child: SizedBox(
          width: 32,
          height: 32,
          child: Image.asset('assets/images/time.png'),
        ),
      ),
    );
  }
}

class MyEventsArchiveViewRoute extends CupertinoPageRoute {
  MyEventsArchiveViewRoute()
      : super(builder: (_) => const MyEventsArchiveView());
}

class MyEventsArchiveView extends StatelessWidget {
  const MyEventsArchiveView({super.key});

  @override
  Widget build(BuildContext context) {
    return _EventsListView(
      events: const [
        MyEvent(
          title: 'Петербургский юридический форум',
          role: 'дирекция и тех персонал',
          dates: '18 - 23 фев',
        ),
      ],
      title: 'архив мероприятий',
      toolBarButton: Text(
        'очистить',
        style: titleSmall.copyWith(color: Colors.black),
      ),
    );
  }
}

class _EventsListView extends StatelessWidget {
  const _EventsListView({
    required this.events,
    required this.title,
    required this.toolBarButton,
  });

  final List<MyEvent> events;
  final String title;
  final Widget toolBarButton;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(height: 22),
          _AppBar(title, toolBarButton),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: events.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (context, i) {
                final event = events[i];
                return Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: grey4,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              event.title,
                              style: titleFont,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              event.roleLabel,
                              style: titleSmallLight.copyWith(color: black2),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              event.dates,
                              style: subLabel.copyWith(color: black2),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      SizedBox(
                        width: 48,
                        height: 48,
                        child: Image.asset('assets/images/placeholder1.png'),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar(this._title, this.toolBarButton);

  final Widget toolBarButton;
  final String _title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SizedBox(
        width: double.infinity,
        height: 64,
        child: Stack(
          children: [
            Positioned.fill(
              child: Center(child: Text(_title, style: titleFont)),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.centerRight,
                child: toolBarButton,
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SizedBox(
                    width: 32,
                    height: 32,
                    child: Image.asset('assets/images/back.png'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
