import 'package:flutter/foundation.dart';

@immutable
class Event {
  const Event({
    required this.title,
    required this.place,
    required this.city,
    required this.image,
    required this.logo,
    required this.dates,
    String? link,
  }) : link = link ?? 'https://t.me/rodimbober';

  final String title;
  final String place;
  final String city;
  final String image;
  final String logo;
  final String dates;
  final String link;

  String get datesWithPlace => '$dates | $place';
}
