import 'dart:typed_data';

class Task {
  final String id;
  final String title;
  final String description;
  final DateTime? deadLine;
  final DateTime createdAt;
  final Uint8List? image;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.deadLine,
    required this.createdAt,
    required this.image,
  });

  factory Task.fromMap(Map<dynamic, dynamic> map) {
    return Task(
      id: map["id"] ,
      title: map["title"] ,
      description: map["description"] ,
      deadLine: map["deadLine"] != null
          ? DateTime.tryParse(map["deadLine"].toString())
          : null,
      createdAt: map["createdAt"] != null
          ? DateTime.tryParse(map["createdAt"].toString())!
          : DateTime.now(),
      image: map["image"] != null ? map["image"] as Uint8List : null,
    );
  }
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "deadLine": deadLine,
      "createdAt": createdAt,
      "image": image,
    };
  }
}
