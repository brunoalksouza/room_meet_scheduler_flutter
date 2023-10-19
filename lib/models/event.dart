// ignore: empty_constructor_bodies
class Event {
  final String title;
  final String description;
  final DateTime date;
  final String start;
  final String end;

  Event({
    required this.title,
    required this.description,
    required this.date,
    required this.start,
    required this.end,
  });

  factory Event.fromMap(Map<String, dynamic> source) {
    return Event(
      title: source["title"],
      description: source["description"],
      date: DateTime.parse(source["date"]),
      start: source["start"],
      end: source["end"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'date': date.toIso8601String(),
      'start': start,
      'end': end,
    };
  }
}
