import 'package:injectable/injectable.dart';
import 'package:light_test/features/home/data/news_repository.dart';
import 'package:light_test/features/home/models/news.dart';

@injectable
class GetNewsUseCase {
  const GetNewsUseCase(this._repository);

  final NewsRepository _repository;

  List<News> call(NewsType? type) {
    final all = _repository.getNews();
    if (type == null) return all;
    return all.where((n) => n.type == type).toList();
  }
}
