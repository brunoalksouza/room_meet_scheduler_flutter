// ignore: empty_constructor_bodies
class Event {
  final String title;
  final String description;
  final DateTime date;
  final String formatedDate;
  final String start;
  final String end;

  Event({
    required this.title,
    required this.description,
    required this.date,
    required this.formatedDate,
    required this.start,
    required this.end,
  });
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'date': date.toIso8601String(),
      'formatedDate': formatedDate,
      'start': start,
      'end': end,
    };
  }
}
