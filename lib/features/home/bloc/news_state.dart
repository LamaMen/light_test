part of 'news_bloc.dart';

@immutable
class NewsState {
  const NewsState(
    this.selected,
    this.isLoading,
    this.news,
  );

  const NewsState.initial()
      : selected = null,
        isLoading = true,
        news = const [];

  final NewsType? selected;
  final bool isLoading;
  final List<News> news;

  NewsState updateSelected(NewsType? type) {
    return NewsState(type, true, news);
  }

  NewsState updateNews(List<News> news) {
    return NewsState(selected, false, news);
  }
}
