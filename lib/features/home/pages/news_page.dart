import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:light_test/core/fonts_and_colors.dart';
import 'package:light_test/core/widgets/buttons.dart';
import 'package:light_test/core/widgets/loader.dart';
import 'package:light_test/features/home/bloc/news_bloc.dart';
import 'package:light_test/features/home/models/news.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  void initState() {
    super.initState();
    context.read<NewsBloc>().add(const GetNewsEvent(null));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 0),
          child: Column(
            children: [
              SizedBox(
                height: 40,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: NewsType.values.length + 1,
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemBuilder: (context, i) {
                    final type = i == 0 ? null : NewsType.values[i - 1];
                    return _NewsTypeChip(type == state.selected, type);
                  },
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: Builder(
                  builder: (context) {
                    if (state.isLoading) {
                      return const Center(
                        child: Loader(48),
                      );
                    }

                    if (state.news.isEmpty) {
                      return Center(
                        child: SizedBox(
                          width: 250,
                          child: Text(
                            'В данной категории нет новостей',
                            style: titleLarge.copyWith(color: black),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }

                    return ListView.separated(
                      itemCount: state.news.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 8),
                      itemBuilder: (context, i) {
                        return _NewsView(state.news[i]);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _NewsTypeChip extends StatelessWidget {
  const _NewsTypeChip(this.isSelected, this.type);

  final bool isSelected;
  final NewsType? type;

  @override
  Widget build(BuildContext context) {
    final style = isSelected ? titleSmall : titleSmallLight;

    return SimpleButton(
      isExpand: false,
      color: isSelected ? primary : grey4,
      padding: const EdgeInsets.fromLTRB(21, 9, 21, 9),
      child: Text(type?.name ?? 'Все', style: style),
      onPressed: () {
        context.read<NewsBloc>().add(GetNewsEvent(type));
      },
    );
  }
}

class _NewsView extends StatelessWidget {
  const _NewsView(this.news);

  final News news;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
          context: context,
          builder: (_) => _FullNewsSheet(news),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: grey4,
        ),
        child: SizedBox(
          height: 96,
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        news.title,
                        style: labelSmall.copyWith(color: black),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(news.dateWithTime1, style: subLabelLight),
                  ],
                ),
              ),
              const SizedBox(width: 24),
              Container(
                width: 96,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(news.image),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FullNewsSheet extends StatelessWidget {
  const _FullNewsSheet(this.news);

  final News news;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      maxChildSize: 0.9,
      initialChildSize: 0.9,
      builder: (context, controller) {
        return Container(
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
            color: white,
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              controller: controller,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'Новость',
                          style: titleFont,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SimpleButton(
                        isExpand: false,
                        color: grey2,
                        radius: 16,
                        padding: const EdgeInsets.all(4),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: SizedBox(
                          width: 24,
                          height: 24,
                          child: Image.asset('assets/images/close.png'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    height: 168,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(news.image),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 16,
                          right: 16,
                          child: SimpleButton(
                            isExpand: false,
                            padding: const EdgeInsets.all(6),
                            radius: 8,
                            color: transparentWhite,
                            child: SizedBox(
                              width: 20,
                              height: 20,
                              child: Image.asset('assets/images/share.png'),
                            ),
                            onPressed: () async {
                              final url = Uri.parse(news.link);
                              await launchUrl(url);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    news.title,
                    style: titleFont,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    news.dateWithTime2,
                    style: bodySmallLight,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    news.body,
                    style: bodySmall,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
