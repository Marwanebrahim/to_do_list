import 'dart:typed_data';

class Task {
  final String title;
  final String discribtion;
  final DateTime? deadLine;
  final DateTime createdAt;
  final Uint8List? image;

  Task({
    required this.title,
    required this.discribtion,
    required this.deadLine,
    required this.createdAt,
    required this.image,
  });
}
