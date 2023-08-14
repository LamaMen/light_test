import 'package:flutter/cupertino.dart';

@immutable
class MyEvent {
  const MyEvent({
    required this.title,
    required this.role,
    required this.dates,
  });

  final String title;
  final String role;
  final String dates;

  String get roleLabel => 'роль: $role';
}
