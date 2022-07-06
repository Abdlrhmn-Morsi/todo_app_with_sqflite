import '../healper/consnant.dart';

class Task {
  int? id;
  String? title;
  dynamic dateTimeCreated;
  bool? isDone;

  Task({
    this.title,
    this.id,
    this.dateTimeCreated,
    this.isDone,
  });

  Task.fromMap(Map<String, dynamic> map) {
    Task(
      title: map[titleColumn],
      dateTimeCreated: map[dateTimeCreatedColumn],
      id: map[idColumn],
      isDone: map[isCheckColumn],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      idColumn: id,
      titleColumn: title,
      dateTimeCreatedColumn: dateTimeCreated,
      isCheckColumn: isDone! ? 1 : 0,
    };
  }
}
