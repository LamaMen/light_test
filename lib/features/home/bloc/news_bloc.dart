import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:light_test/features/home/domain/get_news_usecase.dart';
import 'package:light_test/features/home/models/news.dart';

part 'news_event.dart';

part 'news_state.dart';

@injectable
class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc(this._getNews) : super(const NewsState.initial()) {
    on<GetNewsEvent>(onGetNews);
  }

  final GetNewsUseCase _getNews;

  Future<void> onGetNews(GetNewsEvent event, Emitter emit) async {
    final loadingState = state.updateSelected(event.selected);
    emit(loadingState);

    final news = _getNews(event.selected);
    emit(loadingState.updateNews(news));
  }
}
