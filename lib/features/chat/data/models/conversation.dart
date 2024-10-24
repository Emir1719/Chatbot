// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Conversation {
  final int id;
  String title;

  Conversation({
    required this.id,
    required this.title,
  });

  Conversation copyWith({
    int? id,
    String? title,
  }) {
    return Conversation(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
    };
  }

  factory Conversation.fromMap(Map<String, dynamic> map) {
    return Conversation(
      id: map['id'] as int,
      title: map['title'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Conversation.fromJson(String source) =>
      Conversation.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Conversation(id: $id, title: $title)';

  @override
  bool operator ==(covariant Conversation other) {
    if (identical(this, other)) return true;

    return other.id == id && other.title == title;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode;
}
