part of 'news_bloc.dart';

@immutable
abstract class NewsEvent {}

class GetNewsEvent implements NewsEvent {
  const GetNewsEvent(this.selected);

  final NewsType? selected;
}
