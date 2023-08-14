import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

enum NewsType {
  globalTrends(name: 'Глобальные тренды'),
  industries(name: 'Отрасли'),
  russia(name: 'Российский вектор'),
  finance(name: 'Финансы и торговля'),
  technology(name: 'Технологии будущего'),
  region(name: 'Регионы России'),
  nationalProjects(name: 'Национальные проекты');

  const NewsType({required this.name});

  final String name;
}

@immutable
class News {
  const News({
    required this.title,
    required this.body,
    required this.date,
    required this.time,
    required this.image,
    required this.type,
    String? link,
  }) : link = link ?? 'https://t.me/rodimbober';

  final String title;
  final String body;
  final DateTime date;
  final String time;
  final String image;
  final String link;
  final NewsType type;

  String get dateWithTime1 {
    final formatter = DateFormat('d MMM y', 'ru');
    return '${formatter.format(date)}  ·  $time';
  }

  String get dateWithTime2 {
    final formatter = DateFormat('dd.M.y');
    return '${formatter.format(date)}  ·  $time';
  }
}
