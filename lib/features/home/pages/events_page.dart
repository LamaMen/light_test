import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:light_test/core/fonts_and_colors.dart';
import 'package:light_test/core/widgets/buttons.dart';
import 'package:light_test/core/widgets/dot_indicators.dart';
import 'package:light_test/core/widgets/loader.dart';
import 'package:light_test/features/home/bloc/events_bloc.dart';
import 'package:light_test/features/home/models/event.dart';
import 'package:url_launcher/url_launcher.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  @override
  void initState() {
    super.initState();
    context.read<EventsBloc>().add(const GetEventsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventsBloc, EventsState>(
      builder: (context, state) {
        if (state is SuccessState) {
          return _EventsListView(state.events);
        }

        return const Center(
          child: Loader(48),
        );
      },
    );
  }
}

class _EventsListView extends StatefulWidget {
  const _EventsListView(this.events);

  final List<Event> events;

  @override
  State<_EventsListView> createState() => _EventsListViewState();
}

class _EventsListViewState extends State<_EventsListView> {
  late final PageController _controller;
  late int current;

  @override
  void initState() {
    super.initState();
    current = 0;
    _controller = PageController(initialPage: current, viewportFraction: 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: widget.events.length,
              onPageChanged: (i) {
                setState(() {
                  current = i;
                });
              },
              itemBuilder: (context, i) {
                return _EventView(widget.events[i]);
              },
            ),
          ),
          const SizedBox(height: 16),
          DotIndicators(
            count: widget.events.length,
            current: current,
            color: black,
            secondary: secondary,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

class _EventView extends StatelessWidget {
  const _EventView(this.event);

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6),
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(event.image),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Spacer(),
              SimpleButton(
                isExpand: false,
                padding: const EdgeInsets.all(12),
                radius: 8,
                color: transparentWhite,
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: Image.asset('assets/images/share.png'),
                ),
                onPressed: () async {
                  final url = Uri.parse(event.link);
                  await launchUrl(url);
                },
              )
            ],
          ),
          const Spacer(),
          SizedBox(
            width: 88,
            height: 88,
            child: Image.asset(event.logo),
          ),
          const SizedBox(height: 16),
          Text(event.datesWithPlace, style: titleSmall),
          const SizedBox(height: 8),
          Text(event.title, style: titleMedium),
          const SizedBox(height: 12),
          Text(event.city, style: subLabel),
        ],
      ),
    );
  }
}
